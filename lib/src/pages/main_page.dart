import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/src/commons/theme.dart';
import 'package:flutter_web_dashboard/src/widget/card_tile.dart';
import 'package:flutter_web_dashboard/src/widget/chart_card_tile.dart';
import 'package:flutter_web_dashboard/src/widget/comment_widget.dart';
import 'package:flutter_web_dashboard/src/widget/profile_Widget.dart';
import 'package:flutter_web_dashboard/src/widget/project_widget.dart';
import 'package:flutter_web_dashboard/src/widget/quick_contact.dart';
import 'package:flutter_web_dashboard/src/widget/responsive_widget.dart';
import 'package:flutter_web_dashboard/src/widget/sidebar_menu..dart';
import 'package:http/http.dart' as http;
import '../../view.dart';

class MainPage extends StatelessWidget {
  String _SERVER = 'https://zupco.herokuapp.com/';
  Map<String, dynamic> data = {
    'owner_name' : '',
    'owner_phone_number' : '',
    'owner_residential_address' : '',
    'driver_name' : '',
    'conductor_name' : '',
    'plate_number' : '',
    'phone' : '',
    'residential_address' : '',
    'vehicle_color' : '',
    'routes' : ''
  };

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        if (constraints.maxWidth <= 800) {
          return Center(
            child: Text('Enlarge Screen'),
          );
        } else if (constraints.maxWidth <= 1280 &&
            constraints.maxWidth >= 800) {
          return Center(
            child: Text('Please maximize your browser window'),
          );
        } else if (constraints.maxWidth >= 1280) {
          return Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ResponsiveWidget.isLargeScreen(context)
                    ? SideBarMenu()
                    : Container(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 55,
                        width: _media.width,
                        child: AppBar(
                          elevation: 4,
                          centerTitle: true,
                          title: Text(
                            'ZUPCO Dashboard <Web>',
                          ),
                          backgroundColor: drawerBgColor,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            CardTile(
                                              iconBgColor: Colors.purple,
                                              cardTitle: 'Operators',
                                              icon: Icons.list,
                                              subText: 'Total Number of Operators',
                                              mainText: '5',
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor: Colors.green,
                                              cardTitle: 'Approved',
                                              icon: Icons.check,
                                              subText:
                                                  'Verified Operators',
                                              mainText: '4',
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor: Colors.red,
                                              cardTitle: 'Suspended',
                                              icon: Icons.clear,
                                              subText: 'Suspended Operators',
                                              mainText: '1',
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor:
                                                  Colors.amber,
                                              cardTitle: 'Reports',
                                              icon: Icons.folder,
                                              subText: 'Traffic Reports',
                                              mainText: '0',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: (){
                                                    showFancyCustomDialog(context);
                                                  },
                                                  child: ChartCardTile(
                                                  cardColor: Color(0xFF7560ED),
                                                  cardTitle: 'Add New Operator',
                                                  subText: 'Generate New QR Code ',
                                                  icon: Icons.pie_chart,
                                                  typeText: 'New Operator',
                                                )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ChartCardTile(
                                                  cardColor: Color(0xFF25C6DA),
                                                  cardTitle: 'Remove Operator',
                                                  subText: 'Delete an Operator',
                                                  icon: Icons.cloud_upload,
                                                  typeText: 'Permanetly Remove Operator',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ProjectWidget(media: _media),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  QuickContact(media: _media)
                                ],
                              ),
                            ),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CommentWidget(media: _media),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ProfileWidget(media: _media),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  void showFancyCustomDialog(BuildContext context) {
    final keys = data.keys.toList();
    keys.add('submit');

    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(children: [Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        // height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width/2,
        child: ListView.builder(
          itemCount: keys.length,
          itemBuilder: (context, index){
            if (keys[index]=='submit'){
              return Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.add_circle_outline),
                  title: Text('Register & Generate Operator Code', style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ))
                  ,onTap:(){
                    _addOperator(context);

                  } ,
                )
              );
            }
            return Container(
              child: ListTile(
                leading: Text(keys[index].toUpperCase()),
                title: TextField(
                  onChanged: (value){
                    data[keys[index]] = value;
                  },
                  decoration: InputDecoration(
                    // hintText:
                  ),
                ),
              )
            );
          },
        ),
      ),

    ]),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
 }

 _addOperator(context)async{
   final client = http.Client();
   final response = await client.post(_SERVER+'operators', body: data);
   if (response.statusCode==200){
     final data = jsonDecode(response.body);
     Navigator.push(context, MaterialPageRoute(
       builder: (context)=>QRView(data)
     ));
   }
 }

}

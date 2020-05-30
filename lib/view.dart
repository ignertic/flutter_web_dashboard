import 'package:flutter/material.dart';

class QRView extends StatelessWidget{
  final Map<String, dynamic> data;

  QRView(this.data);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Plain Version', style: TextStyle(
                  fontSize: 50
                )),
                Container(
                  width: 500,
                  height: 500,
                  child: Image.network(data['unencrypted'])),
                Text('This can be read by anyone with a simple QR Scanner from Play Store or App Store')
              ],
            ),
            Column(
              children: <Widget>[
                Text('Encrypted Version',style: TextStyle(
                  fontSize: 50
                )),
                Container(
                  width: 500,
                  height: 500,
                  child: Image.network(data['encrypted'])),
                  Text('This can only be decoded by the ZUPCO Scanner App')
              ],
            )
          ],
        ),
      ),
    );
  }

  _getImage(){

  }
}

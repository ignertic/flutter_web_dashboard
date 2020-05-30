import 'package:flutter/material.dart';


class Results extends StatelessWidget{
  final List data;
  Results(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search Results')
      ),
      body: ListView.builder(
        itemCount: this.data.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(data[index]['owner_name']),
            subtitle: Text(data[index]['phone']),
            leading: CircleAvatar(
              // backgroundImage: NetworkImage(data[index]['image']),
            ),
          );
        }
      )
    );
  }

}

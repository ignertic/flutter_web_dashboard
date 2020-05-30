import 'package:flutter/material.dart';

enum Status { Pending, Approved, Rejected }

class Comment {
  String name;
  String comment;
  Status status;
  String image;
  Color color;
  String date;

  Comment(
      {this.name,
      this.comment,
      this.status,
      this.image,
      this.color,
      this.date});
}

List<Comment> commentList = [
  Comment(
    name: 'Central Police Headquaters',
    status: Status.Pending,
    image: 'https://upload.wikimedia.org/wikipedia/en/9/94/Zimbabwe_Republic_Police.jpg',
    color: Colors.blue,
    date: 'May 19, 2020',
    comment:
        'Requesting details for plate number B123-REW for suspicious activities',
  ),
  Comment(
    name: 'ZUPCO Operator',
    status: Status.Approved,
    image: 'https://lh3.googleusercontent.com/proxy/tYIgF9h283cAc5nZio8ANXgD2UMyR7mjH5I02d-GpERWHY7xvUNfen4y_sIf7c7iGZ6NY90H7Ja3iF8iuOriVYI0B0c',
    date: 'May 19, 2020',
    color: Colors.green,
    comment:
        'Requesting QR Code Renewal for B232-POE.',
  ),
  Comment(
    name: 'Minstry Of Transport and Infrastructure Development',
    status: Status.Pending,
    color: Colors.red,
    image: 'https://pbs.twimg.com/profile_images/1118031212239568896/iAV6nc42.jpg',
    date: 'May 19, 2019',
    comment:
        'Requesting list of suspended operators',
  ),

];

import 'package:flutter/material.dart';

enum Priority {
  Low,
  Medium,
  High,
  Active,
  Suspended
}

class Project {
  String assigned;
  String name;
  Priority priority;
  double budget;
  String position;
  String image;
  Color color;

  Project(
      {this.assigned,
      this.name,
      this.priority,
      this.budget,
      this.image,
      this.position,
      this.color});
}

List<Project> projectItems = [
  Project(
      assigned: 'Gishobert Gwenzi',
      name: 'AAB 453',
      priority: Priority.Active,
      position: ' ',
      budget: 0,
      color: Colors.green),
  Project(
    assigned: 'Dylan Goredema',
    name: 'AAB 123',
    priority: Priority.Active,
    position: ' ',
    budget: 0,
    color: Colors.green,
  ),
  Project(
    assigned: 'Gary Manuel',
    name: 'AAB 233',
    priority: Priority.Suspended,
    position: ' ',
    budget: 12,
    color: Colors.red,
  ),
  Project(
    assigned: 'Daniel Mangwanya',
    name: 'RRR 232',
    priority: Priority.Active,
    position: 'Frontend Eng',
    budget: 1,
    color: Colors.green,
  ),
  Project(
    assigned: 'Carol ',
    name: 'Y-A-D-I-S',
    priority: Priority.Active,
    position: 'Content Writer',
    budget: 0,
    color: Colors.green,
  ),
];

import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskItem extends StatelessWidget {
    final Task task;
    const TaskItem({super.key, required this.task});

    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha : 0.05),
              offset: Offset(0, 4),
              blurRadius: 10  
            )
          ]
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
        child: Row(
          children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: task.dotColor,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.category, style: TextStyle(color : Colors.grey, fontSize: 14)),
                  
                  Text(task.title, style: TextStyle(color : Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              ),
              
              Container(
                padding : EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color : task.priorityColor.withValues(alpha: 0.15),
                ),
                child: Text(task.priority, style : TextStyle(color : task.priorityColor)),
              )
          ],
        ),
      );
    }
}
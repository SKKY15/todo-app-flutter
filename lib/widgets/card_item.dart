import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/models/challenge.dart';

class Carditem extends StatelessWidget {
  final Challenge card;
  const Carditem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right : 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2B74F5), 
            Color(0xFF0A2E7A), 
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children : [  
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SvgPicture.asset("assets/ic_calendar.svg",width: 18,height: 18),
                  SizedBox(width: 4),
                  Text(card.timeLeft, style : TextStyle(
                    color : Colors.white,
                    fontSize: 16
                  )),
              ],
            ),
            SizedBox(height: 16),
            Text(card.category, style: TextStyle(fontSize: 20, color : Colors.white)),
            SizedBox(height: 6),
            Row(
              children: [
                Text("Deadline : ", style: TextStyle(fontSize: 14, color : Colors.white)),
                Expanded(child:  Text(card.formattedDate, style: TextStyle(fontSize: 14, color : Colors.white)),)
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: Stack(
                children: [
                  _avatar("assets/avatar.jpg", 0),
                  _avatar("assets/avatar.jpg", 25),
                  _avatar("assets/avatar.jpg", 50),
                  _avatar("assets/avatar.jpg", 75),
                  _avatar("assets/avatar.jpg", 100),
                  Positioned(
                    left: 125,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Text(
                        "+5",
                        style: TextStyle(
                          color: Colors.lightGreenAccent.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text("Progression", style: TextStyle(
                    color : Colors.white,
                    fontSize: 14
                  )),
                  Text("${(card.progress * 100).toInt()}%",
                  style: TextStyle(
                    color : Colors.white,
                    fontSize: 14
                  ),),
              ],
            ),
            SizedBox(height: 4),
            Stack(
              children: [
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Progress (solid white)
                FractionallySizedBox(
                  widthFactor: card.progress,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),

          ]
        ),
      
      ),
      
    );
  }
}

Widget _avatar(String path, double left) {
  return Positioned(
    left: left,
    child: CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 17,
        backgroundImage: AssetImage(path),
      ),
    ),
  );
}
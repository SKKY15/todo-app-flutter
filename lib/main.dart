import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/challenge.dart';
import 'package:todo_list/widgets/card_item.dart';
import 'package:todo_list/widgets/customer_bottom_nav.dart';
import 'package:todo_list/widgets/task_item.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});



  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentPage = 0;
  int _currentNavIndex = 0;
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );

 @override
void initState() {
  super.initState();


  Challenge.create(
    category: "Weekly challenge",
    date: DateTime.now().add(const Duration(days: 7)),
    progress: 0.65,
  );
  Challenge.create(
    category: "Monthly goal",
    date: DateTime.now().add(const Duration(days: 30)),
    progress: 0.30,
  );
  Challenge.create(
    category: "Sprint task",
    date: DateTime.now().add(const Duration(days: 3)),
    progress: 0.85,
  );
  Challenge.create(
    category: "Project deadline",
    date: DateTime.now().add(const Duration(days: 90)),
    progress: 0.45,
  );
  Challenge.create(
    category: "Yearly target",
    date: DateTime.now().add(const Duration(days: 200)),
    progress: 0.15,
  );


  Task.create(
    category: "Weekly challenge",
    title: "Design app to-do list",
    priority: "High",
    dotColor: Colors.lightBlueAccent,
  );
  Task.create(
    category: "Daily task",
    title: "Buy groceries",
    priority: "Low",
    dotColor: Colors.greenAccent,
  );
  Task.create(
    category: "Work",
    title: "Send weekly report to manager",
    priority: "High",
    dotColor: Colors.redAccent,
  );
  Task.create(
    category: "Personal",
    title: "Call mom for her birthday",
    priority: "Medium",
    dotColor: Colors.purpleAccent,
  );
  Task.create(
    category: "Fitness",
    title: "Go to the gym",
    priority: "Medium",
    dotColor: Colors.orangeAccent,
  );
  Task.create(
    category: "Study",
    title: "Finish Flutter tutorial",
    priority: "High",
    dotColor: Colors.blueAccent,
  );
  Task.create(
    category: "Shopping",
    title: "Buy new headphones",
    priority: "Low",
    dotColor: Colors.tealAccent,
  );
  Task.create(
    category: "Meeting",
    title: "Team standup at 10 AM",
    priority: "High",
    dotColor: Colors.pinkAccent,
  );
  Task.create(
    category: "Health",
    title: "Doctor appointment",
    priority: "High",
    dotColor: Colors.red,
  );
  Task.create(
    category: "Hobby",
    title: "Practice guitar for 30 mins",
    priority: "Low",
    dotColor: Colors.yellow,
  );
  Task.create(
    category: "Project",
    title: "Fix login bug on website",
    priority: "Medium",
    dotColor: Colors.indigoAccent,
  );
  Task.create(
    category: "Reading",
    title: "Read 20 pages of Atomic Habits",
    priority: "Low",
    dotColor: Colors.brown,
  );
  Task.create(
    category: "Travel",
    title: "Book flight tickets to Paris",
    priority: "Medium",
    dotColor: Colors.cyan,
  );
  Task.create(
    category: "Home",
    title: "Clean the kitchen",
    priority: "Low",
    dotColor: Colors.lime,
  );
  Task.create(
    category: "Finance",
    title: "Pay electricity bill",
    priority: "High",
    dotColor: Colors.deepOrangeAccent,
  );
  Task.create(
    category: "Social",
    title: "Lunch with Sarah",
    priority: "Medium",
    dotColor: Colors.deepPurpleAccent,
  );
  Task.create(
    category: "Work",
    title: "Review pull requests",
    priority: "Medium",
    dotColor: Colors.amber,
  );
  Task.create(
    category: "Self-care",
    title: "Meditate for 10 minutes",
    priority: "Low",
    dotColor: Colors.lightGreen,
  );
  Task.create(
    category: "Learning",
    title: "Watch Dart advanced course",
    priority: "Medium",
    dotColor: Colors.blue,
  );
  Task.create(
    category: "Urgent",
    title: "Submit visa application",
    priority: "High",
    dotColor: Colors.redAccent,
  );

  
}


  @override void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final tasks = Task.getAll();
    final challenges = Challenge.getAll();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title : Padding(
          padding : EdgeInsets.symmetric(horizontal : 16.0, vertical: 16.0),
          child : Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 25,
              
              backgroundImage: AssetImage("assets/avatar.jpg"),
            ),
            SizedBox(width : 12),

            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi,Lancel", style : TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(height: 4),
                Text("UI/UX Designer", style : TextStyle(
                  fontSize: 14,
                )),
              ],
            )
          ,)
          ],
        ),),
        actions : [

            IconButton(
              onPressed: () {


              },
              icon: SvgPicture.asset("assets/ic_notif.svg", width: 26, height: 26),
              ),

            SizedBox(width: 10),

            IconButton(
              onPressed: () {

              },
              icon: SvgPicture.asset("assets/ic_msg.svg", width: 26, height: 26),
              ),


            SizedBox(width: 10),

        ]

      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
      padding : EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0,16.0,0.0,16.0),
            child : SizedBox(
            height: 260,
            child: PageView.builder(
              controller: _pageController, 
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padEnds: false,
              itemCount: challenges.length,
              itemBuilder: (context, index) =>  Carditem(card:  challenges[index]),
            ),
          ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(challenges.length, (index) {
              bool isActive = index == _currentPage;
              return AnimatedContainer(duration : const Duration(milliseconds: 300),
                margin : const EdgeInsets.symmetric(horizontal: 3),
                height: 8,
                curve: Curves.easeInOut,
                width: isActive ? 24 : 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.blue : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),

          Padding(
            padding : EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
                      "Task for you",
                      style: TextStyle(
                        color : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                      "View in schedule →",
                      style : TextStyle(
                        color : Color(0xFF2f72de),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )
                    
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding : EdgeInsets.symmetric(horizontal: 16.0),
            child : Column(
              
              children: tasks.map((task) => Dismissible(
                
                key: ValueKey(task.id), 
                direction: DismissDirection.endToStart,
                movementDuration: const Duration(milliseconds: 300),
                resizeDuration: const Duration(milliseconds: 400),
                dismissThresholds: const {
                  DismissDirection.endToStart: 0.3,
                },
                onDismissed: (direction) {
                  setState(() {
                    task.delete();
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content : Text("${task.title} deleted"),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,           
                    ),
                  );
                },
                background: Container(
                  margin : EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right : 20),
                  decoration: BoxDecoration(
                    color : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white, size: 28),
                ),
                child:  TaskItem(task : task),
                
                
                )).toList(),
            )
          ),
      
        ],
      ),
      
    ),
      ),
    
      bottomNavigationBar: CustomerBottomNav(currentIndex: _currentNavIndex, onTap: (index) {
        setState(() {
          _currentNavIndex = index;
        });
      }),

    );
    
    
    
  }
}




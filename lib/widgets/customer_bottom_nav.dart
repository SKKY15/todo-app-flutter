import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomerBottomNav extends StatelessWidget {
    final int currentIndex;
    final Function(int) onTap;
    const CustomerBottomNav({super.key, required this.currentIndex, required this.onTap});

    @override
  Widget build(BuildContext context) {
    return Container(
        height : 70,
        margin: EdgeInsets.only(left : 16.0, bottom : 16.0, right: 16.0),
        decoration: BoxDecoration(
          color : Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
             color: Colors.black.withValues(alpha: 0.1),
             blurRadius: 20,
             offset: const Offset(0,5)
            )
          ]
        ),

        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                _buildNavItem("assets/ic_home.svg", 0),
                _buildNavItem("assets/ic_calendar.svg", 1),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 63,
                      height: 63,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color : const Color.fromARGB(255, 190, 232, 251)
                      ),
                    ),
                    GestureDetector(
                      onTap: () => onTap(2),
                      child : Container(
                        width : 55,
                        height: 55,
                        decoration: const BoxDecoration(
                            color : Colors.blue,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/ic_plus.svg", width: 24, height: 24),
                        ),
                      )
                    ),
                    
                  ],
                ),

                _buildNavItem("assets/ic_list.svg", 3),
                _buildNavItem("assets/ic_user.svg", 4),
          ],
        )
    );
  }
  
  Widget _buildNavItem(String assetPath, int index) {
      bool isActive = currentIndex == index;
      return IconButton(
      onPressed: () {
        onTap(index);
      }, 
      
      icon: SvgPicture.asset(assetPath,width: 24,height: 24,colorFilter: ColorFilter.mode(
          isActive ? Colors.blue : Colors.grey.shade400,
          BlendMode.srcIn,
        ),)
      
      );
  }
}

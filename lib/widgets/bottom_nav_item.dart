import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final bool isSelected;
  final String? name;
  BottomNavItem({required this.iconData, required this.onTap, this.isSelected = false, this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        padding: EdgeInsets.only(top: 2),
        icon: Column(
          children: [
            Icon(iconData, color: isSelected ? Colors.deepPurple : Colors.deepPurple, size: 25),
            SizedBox(height: 5,),
            Text(name!,style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.deepPurple : Colors.white,
            ),),
          ],
        ),
        onPressed: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Color? backgroundColor;

  CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.backgroundColor =
        Colors.white, // Set default background color to white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

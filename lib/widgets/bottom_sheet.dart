import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget title;
  final List<String> items;
  final Function(String) onItemSelected;
  final bool shouldPop;
   final double? height;

   CustomBottomSheet({
      this.height,
    required this.title,
    required this.items,
    required this.onItemSelected,
    this.shouldPop = true,
  });

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 10,
                width: 60,

              ),
            )
          ),
          widget.items != null
              ? Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.items[index],style: TextStyle(color: Colors.deepPurple),),
                  onTap: () {
                    setState(() {
                      selectedItem = widget.items[index];
                    });
                    widget.onItemSelected(selectedItem);
                    if (widget.shouldPop) {
                      Get.back();
                    }
                  },
                );
              },
            ),
          )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

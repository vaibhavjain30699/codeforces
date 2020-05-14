import 'package:flutter/material.dart';
import 'package:codeforces/constants.dart';

class DrawerListItem extends StatelessWidget {
  DrawerListItem({this.item, this.labelText, this.onTap, this.selectedItem});

  final DrawerSelection item;
  final DrawerSelection selectedItem;
  final String labelText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selectedItem == item ? Colors.lightBlueAccent.shade50 : null,
      child: ListTile(
        onTap: onTap,
        selected: selectedItem == item,
        title: Text(
          labelText,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codeforces/constants.dart';

class DrawerListItem extends StatelessWidget {
  DrawerListItem(
      {this.item, this.labelText, this.onTap, this.selectedItem, this.icon});

  final DrawerSelection item;
  final DrawerSelection selectedItem;
  final String labelText;
  final Function onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      color: selectedItem == item ? Colors.lightBlueAccent.shade50 : null,
      child: ListTile(
        onTap: onTap,
        selected: selectedItem == item,
        title: Text(
          labelText,
        ),
        leading: icon,
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}

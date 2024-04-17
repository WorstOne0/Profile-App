// Flutter packages
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({
    required this.items,
    required this.indexSelected,
    required this.onTap,
    super.key,
  });

  final List<({int page, IconData icon, String text})> items;
  final int indexSelected;
  final Function(int index) onTap;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Theme.of(context).brightness == Brightness.light ? 10 : 1,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: widget.items.length <= 3
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 25)
            : const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GNav(
          selectedIndex: widget.indexSelected,
          onTabChange: widget.onTap,
          backgroundColor: Colors.transparent,
          color: Theme.of(context).brightness == Brightness.light
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          activeColor: Theme.of(context).brightness == Brightness.light
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          tabActiveBorder: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade600,
            width: 1,
          ),
          gap: 8,
          padding: widget.items.length <= 3
              ? const EdgeInsets.symmetric(vertical: 10, horizontal: 25)
              : const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          tabs: widget.items
              .map(
                (item) => GButton(
                  icon: item.icon,
                  text: item.text,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

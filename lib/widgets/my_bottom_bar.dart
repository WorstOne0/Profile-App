// Flutter packages
import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
  }

  Widget buildItem(int index, IconData iconData, String label) {
    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(index),
        radius: 50,
        child: Ink(
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 60,
                    height: widget.indexSelected == index ? 5 : 0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Icon(
                        iconData,
                        color: widget.indexSelected == index
                            ? Theme.of(context).brightness == Brightness.light
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white
                            : Colors.grey,
                        // size: widget.indexSelected == index ? 26 : 24,
                      ),
                      Text(
                        label,
                        style: TextStyle(
                          color: widget.indexSelected == index
                              ? Theme.of(context).brightness == Brightness.light
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white
                              : Colors.grey,
                          // fontSize: widget.indexSelected == index ? 12 : 14,
                          fontWeight: widget.indexSelected == index ? FontWeight.bold : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.center,
      child: Card(
        elevation: Theme.of(context).brightness == Brightness.light ? 10 : 1,
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            ...List.generate(
              widget.items.length,
              (index) => buildItem(
                widget.items[index].page,
                widget.items[index].icon,
                widget.items[index].text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

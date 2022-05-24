import 'package:flutter/material.dart';

class ColorList extends StatelessWidget {
  const ColorList(
      {Key? key,
      required this.colors,
      required this.currentIndex,
      required this.onItemTap})
      : super(key: key);

  final int currentIndex;
  final List<Color> colors;
  final Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onItemTap(index),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: currentIndex == index ? 25 : 22,
                  backgroundColor:
                      currentIndex == index ? Colors.black : Colors.black26,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: colors[index],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

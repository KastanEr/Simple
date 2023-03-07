import 'package:flutter/material.dart';

class TagBlock extends StatelessWidget {
  final String tagName;
  const TagBlock({
    required this.tagName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
            child: Text(
              "취미",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("delete");
            },
            child: const Icon(
              Icons.close_rounded,
              size: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

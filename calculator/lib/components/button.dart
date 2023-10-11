import 'package:flutter/material.dart';






class my_Button extends StatelessWidget {

  final String Title;
  final Color color;
  final VoidCallback onPress;

  const my_Button({Key? key,required this.Title,
    this.color = Colors.white,
  required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.4),
                ),
              ],
            ),
            child: Center(
              child: Text(Title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }
}
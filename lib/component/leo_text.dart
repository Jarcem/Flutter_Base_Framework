import 'package:flutter/material.dart';

class LeoText extends StatefulWidget {
    LeoText(this.text, {this.color = Colors.black, this.fontWeight = FontWeight.w400, this.size = 14, this.align: TextAlign.left});
    final String text;
    final Color color;
    final FontWeight fontWeight;
    final double size;
    final TextAlign align;

    @override
    State<StatefulWidget> createState() {
        return LeoTextState();
    }
  
}

class LeoTextState extends State<LeoText> {
    @override
    Widget build(BuildContext context) {
        return Text(widget.text,
            textAlign: widget.align,
            style: TextStyle(
                color: widget.color,
                fontWeight: widget.fontWeight,
                fontSize: widget.size,
            ),

        );
    }
  
}
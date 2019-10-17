import 'package:flutter/material.dart';

class LeoButtons {
    static Widget minBtn({Widget child, onPressed, EdgeInsetsGeometry padding, ShapeBorder shape, Color color}) {
        return Theme(
            data: ThemeData(
                buttonTheme: ButtonThemeData(
                    minWidth: 0,
                    height: 0,
                    padding: EdgeInsets.all(0),
                )
            ),
            child: FlatButton(
                child: child,
                onPressed: onPressed,
                padding: padding,
                shape: shape,
                color: color,
            ),
        );
    }
}
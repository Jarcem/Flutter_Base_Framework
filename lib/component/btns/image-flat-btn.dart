import 'package:flutter/material.dart';
import 'package:stone_shop/leolib/utils/utils.dart';

class ImageFlatBtn extends StatefulWidget {
    ImageFlatBtn(this.image, {this.imgSize = 30, this.color, this.splashColor, this.text = "", this.textColor, this.onPressed, this.imgColor});
    final String image;
    final Color color;
    final Color splashColor;
    final String text;
    final Color textColor;
    final Function onPressed;
    final Color imgColor;
    final double imgSize;

    @override
    State<StatefulWidget> createState() {
        return ImageFlatBtnState();
    }

}

class ImageFlatBtnState extends State<ImageFlatBtn> {
    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                color: widget.color,
            ),
            child: FlatButton(
                color: widget.color,
                splashColor: widget.splashColor,
                child: Row(
                    children: <Widget>[
                        Offstage(
                            offstage: Utils.isEmpty(widget.image),
                            child:Image(
                                image: AssetImage(widget.image),
                                width: widget.imgSize,
                                height: widget.imgSize,
                                color: widget.imgColor,
                            ),
                        ),
                        Text(widget.text,
                            style: TextStyle(
                                color: widget.textColor,
                            ),
                        ),
                    ],
                ),
                onPressed: widget.onPressed,
            ),
        );
    }

}
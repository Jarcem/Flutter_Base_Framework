import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stone_shop/leolib/LeoToast.dart';

import 'leo_text.dart';


class LeoAlert {
    static Future<bool> alert(BuildContext context, String content, {String title = "提示", Function onPressed}) async{
        return Alert(context: context, title: title, desc: content,
            buttons: [
                DialogButton(
                    color: Colors.red[400],
                    child: Text(
                        "确定",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                        Navigator.pop(context);
                        if (onPressed != null) {
                            onPressed();
                        }
                    },
                    width: 100,
                )
            ],
            closeFunction: () {}
        ).show();
    }
    static Future<bool> alertInput(BuildContext context, String inputTitle, Function(String value) onClickConfirm,
        {
            int maxLength,
            TextInputType inputType = TextInputType.text,
            String suffixText = ""
        })
    {
        var inputContent = "";
        FocusNode focusNode = FocusNode();
        return Alert(context: context,title: inputTitle,
            closeFunction: () {},
            content: TextField(
                autofocus: true,
                focusNode: focusNode,
                maxLength: maxLength,
                keyboardType: inputType,
                textInputAction: TextInputAction.done,

                onChanged: (String value) {
                    inputContent = value;
                },
                decoration: InputDecoration(
                    suffixText: suffixText
                ),
            ),
            buttons: <DialogButton>[
                DialogButton(child: LeoText("确定", color: Colors.white, size: 18,),
                    color: Color(0xFF7A2FF6),
                    onPressed: () {
                        if (inputContent.length == 0) {
                            LeoToast("请输入$inputTitle");
                            return;
                        }
                        focusNode.unfocus();
                        Navigator.pop(context);
                        onClickConfirm(inputContent);
                    },
                )
            ]
        ).show();
    }
}
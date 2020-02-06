import 'package:flutter/material.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class CustomTile extends StatelessWidget {
  final Widget leading, title, icon, subtitle, trailing;
  final bool mini;
  final EdgeInsets margin;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;

  const CustomTile(
      {@required this.leading,
      @required this.title,
      this.icon,
      @required this.subtitle,
      this.trailing,
      this.mini = true,
      this.margin = const EdgeInsets.all(0),
      this.onTap,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: mini ? 10 : 0),
        margin: margin,
        child: Row(
          children: <Widget>[
            leading,
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: mini ? 10 : 15),
                padding: EdgeInsets.symmetric(vertical: mini ? 3 : 20),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: UniversalVariables.separatorColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        title,
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            icon ?? Container(),
                            // icon != null ? icon : Container(),
                            subtitle
                          ],
                        )
                      ],
                    ),
                    trailing ?? Container()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

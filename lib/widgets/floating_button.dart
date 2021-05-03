import 'package:blog_app/helpers/colors.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({required this.buttonText, required this.onPressed});

  final String buttonText;
  final Function() onPressed;
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider themeChange =
        Provider.of<DarkThemeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(bottom: 10),
      height: kFloatingActionButtonMargin * 3,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:
                themeChange.darkTheme ? Colors.white : AppTheme.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonText,
            style: TextStyle(
                color: themeChange.darkTheme
                    ? AppTheme.primaryColor
                    : Colors.white,
                fontSize: 18),
          )),
    );
  }
}

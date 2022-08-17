import 'package:flutter/material.dart';

class CustomButtonIconLarge extends StatelessWidget {
  const CustomButtonIconLarge(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Colors.transparent,
      this.iconData})
      : super(key: key);

  final GestureTapCallback onPressed;
  final String text;
  final Color color;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Theme.of(context).primaryColorLight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(defineColor(context)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)))),
          child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).hoverColor),
                    textAlign: TextAlign.center,
                  ),
                  Icon(iconData, color: Colors.white, size: 23)
                ],
              ))),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).highlightColor;
    } else {
      return color;
    }
  }
}

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge(
      {Key? key,
      required this.text,
      this.onPressed,
      this.color = Colors.transparent})
      : super(key: key);

  final GestureTapCallback? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(21)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_defineColor(context)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text(
              text,
              style: onPressed == null
                  ? const TextStyle(color: Colors.white30)
                  : Theme.of(context).textTheme.button,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }

  Color _defineColor(BuildContext context) {
    if (onPressed == null) {
      return Theme.of(context).disabledColor;
    } else if (color == Colors.transparent) {
      return Theme.of(context).primaryColorLight;
    } else {
      return color;
    }
  }
}

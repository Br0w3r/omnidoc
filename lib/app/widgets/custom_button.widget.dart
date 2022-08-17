import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blue,
      this.size = 15})
      : super(key: key);

  final GestureTapCallback? onPressed;
  final String text;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: defineColor(context),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
          width: 2,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(defineColor(context)),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).inputDecorationTheme.fillColor!)),
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: onPressed != null
                  ? TextStyle(fontSize: size, color: Colors.white)
                  : TextStyle(fontSize: size, color: Colors.white24),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.fade,
            )),
      ),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).primaryColor;
    } else {
      return color;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GradientButton extends StatefulWidget {
  GradientButton(this.text, this.onPressed,{Key? key}) : super(key: key);
  String text;
  VoidCallback? onPressed;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff1cfbf9),
            Color(0xffee8eff),
          ],
        ),
      ),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.h)),
              ),
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.black45;
              }
              return Colors.black87;
            }),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.pressed) ? null : null;
              },
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

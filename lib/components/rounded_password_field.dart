import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_field_container.dart';
import 'package:flutter_app/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController editText;

  const RoundedPasswordField({
    this.onChanged,
    this.editText,
  });

  @override
  State<StatefulWidget> createState() {
    return _RoundedPasswordFieldState(onChanged: onChanged, editText: editText);
  }
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final ValueChanged<String> onChanged;
  final TextEditingController editText;
  bool show = true;

  _RoundedPasswordFieldState({
    this.onChanged,
    this.editText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: show,
        onChanged: onChanged,
        controller: editText,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: kPrimaryColor,
            onPressed: () {
              setState(() {
                if (show == false)
                  show = true;
                else
                  show = false;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

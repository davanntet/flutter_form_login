import 'package:flutter/material.dart';
import 'package:flutter_form_login/utils/FormType.dart';

class InputTextTemplate extends StatefulWidget {
  const InputTextTemplate({
    super.key,
    this.isHint = false,
    required TextEditingController controller,
    required this.placholder,
    required this.label,
    required this.startIcan,
    required this.lastIcon, required this.inputType,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String placholder;
  final String label;
  final IconData startIcan;
  final Widget lastIcon;
  final bool isHint;
  final String inputType;
  @override
  State<InputTextTemplate> createState() => _InputTextTemplateState();
}

class _InputTextTemplateState extends State<InputTextTemplate> {
  late TextInputType keyType;
  @override
  Widget build(BuildContext context) {
    keyType = widget.inputType==FormType.email?TextInputType.text:TextInputType.visiblePassword;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){
            if(widget.inputType == FormType.email){
                if(value!.trim().contains(RegExp(r'[^\w\s]'))){
                  return "Please Input only username";
                }else if(value!.trim().length<5){
                  return "Username is soo short";
                }
            }else if(widget.inputType == FormType.password){
                if(value!.trim().length<8){
                  return "password must greater than 8 digit";
                }else if(value!.trim().length>=8&&!value!.trim().contains(RegExp(r'[^\w\s]'))){
                  return "password not strong";
                }

            }


      },
      obscureText: widget.isHint,
      keyboardType: keyType,
      controller: widget._controller,
      decoration: InputDecoration(
          hintText: widget.placholder,
          label: Text(
            widget.label,
            style: TextStyle(fontSize: 17),
          ),
          prefixIcon: Icon(
            widget.startIcan,
            color: Colors.purple,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
          ),
          suffix: widget.lastIcon,
          border: OutlineInputBorder()),
    );
  }
}

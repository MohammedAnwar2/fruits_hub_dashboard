import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fruits_hub_dashboard/core/functions/conver_colors.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({super.key, required this.onColorChanged, this.currentColor});
  final Function(Color color) onColorChanged;
  final Color? currentColor;
  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  
  late Color pickerColor ;
  late Color currentColor;
  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }
  @override
  void initState() {
    super.initState();
    currentColor = widget.currentColor ?? Color(0xff443a49);
    pickerColor = currentColor;
  }

  Future<String?> openColorPicker(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
              enableAlpha: true,
              hexInputBar: true,
              displayThumbColor: true,
              colorHistory: [
                Color(0xff443a49),
                Color(0xffbdc3c7),
                Color(0xfff1c40f),
                Color(0xffe67e22),
                Color(0xffe74c3c),
                Color(0xff2ecc71),
                Color(0xff3498db),
              ],
              onHistoryChanged: (value) {},
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop(colorToString(currentColor));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(backgroundColor: currentColor),
        SizedBox(width: 20),
        TextButton(
            onPressed: () async {
              final result = await openColorPicker(context);
              if (result != null) {
                setState(() {
                  currentColor = stringToColor(result);
                  widget.onColorChanged(currentColor);
                });
              }
            },
            child: const Text('Select Color'))
      ],
    );
  }
}

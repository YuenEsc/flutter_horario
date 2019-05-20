import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_horario/models/colors.dart';

class ColorFormPicker extends FormField<Color> {
  final ValueChanged<Color> onColorChange;
  final Color initialValue;
  ColorFormPicker({
    ValueChanged<Color> onColorChange,
    FormFieldSetter<Color> onSaved,
    FormFieldValidator<Color> validator,
    Color initialValue,
    bool autovalidate = false
  }) :  onColorChange = onColorChange ?? null,
        initialValue = initialValue ?? Colors.red,
        super(
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      autovalidate: autovalidate,
      builder: (FormFieldState<Color> state) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: CircleColor(
              circleSize: 60,
              elevation: 0.0,
              color: state.value,
              onColorChoose: ()async{
                await showColorDialog(state, onColorChange);

              },
            ),
          )
        );
      }
  );

  static Future<void> showColorDialog(FormFieldState<Color> state, ValueChanged<Color> onColorChanged) async {
    return showDialog<void>(
      context: state.context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: independence,
          title: Text('Selecciona un color:'),
          content: SingleChildScrollView(
            child: MaterialColorPicker(
              allowShades: false,
              onMainColorChange: (Color color) {
                state.didChange(color);
                onColorChanged(color);
              },
              selectedColor: state.value,
              colors: <ColorSwatch>[
                mandarin,
                ufoGreen,
                maximumYellowRed,
                spiroDiscoBall,
                heliotrope,
                fieryRose,
                turquoise,
                gold,
                fieldDrab,
                mediumOrchid,
                navyPurple,bittersweet,
                roseRed,
                grainYellow,
                begonia,
                celadonGreen,
                seaGreen,
                cobaltBlue,
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              color: fieryRose,
              child: Text("CERRAR",
                style: Theme.of(context).textTheme.copyWith(button: TextStyle(
                  color: Colors.white,
                )).button,
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


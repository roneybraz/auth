import 'package:flutter/services.dart';

class TextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue? newValue) {
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    String texto = newValue!.text;

    for (int i = 0; i < withDia.length; i++) {
      texto = texto.replaceAll(withDia[i], withoutDia[i]);
    }
    return TextEditingValue(
      text: texto,
      selection: newValue.selection,
    );
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "Senha é obrigatório";
  } else if (value.length < 4) {
    return "Senha deve ter no mínimo 4 caracteres ";
  }

  return null;
}

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return "e-mail é obrigatório";
  }
  String regraEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(regraEmail);
  if (!regExp.hasMatch(value)) {
    return "e-mail inválido";
  }
  return null;
}

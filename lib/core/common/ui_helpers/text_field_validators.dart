
class TextFieldValidatorHelpers{

  static const String _patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


  static basicField(String? value){
    return ( (value ?? '').isEmpty )
        ? 'Este Campo No Puede Estar Vacío'
        : null;
  }

  static email(String? value) {
    RegExp regExp = RegExp(_patternEmail);
    return regExp.hasMatch(value ?? '')
        ? null
        : 'Formato De Correo Inválido';
  }

  static password(String? value) {
    return ((value ?? '').length >= 6)
        ? null
        : 'La Contraseña Debe Tener Mínimo 6 Caracteres';
  }

  static rePassword(String? password, String? rePassword) {
    return (rePassword != null && password == rePassword)
        ? null
        : 'Las contraseñas No Coinciden';
  }

}
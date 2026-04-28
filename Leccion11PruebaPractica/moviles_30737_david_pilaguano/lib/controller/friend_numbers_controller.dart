import '../model/friend_numbers_model.dart';

class FriendNumbersController {
  final FriendNumbersModel _model = FriendNumbersModel();

  String checkAmigos(String valA, String valB) {
    int? a = int.tryParse(valA);
    int? b = int.tryParse(valB);

    if (a == null || b == null || a <= 0 || b <= 0) {
      return "Por favor, ingrese números enteros positivos válidos y llene todos los campos.";
    }

    if (_model.areFriends(a, b)) {
      return "¡$a y $b son números amigos!";
    } else {
      return "$a y $b no son números amigos.";
    }
  }
}

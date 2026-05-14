import 'package:tarea_cracion_movil/model/member_model.dart';

class MemberController {
  // Datos de ejemplo para los 5 miembros
  List<Member> getMembers() {
    return [
      Member(
        name: "Miembro 1",
        lastWeight: 80.0,
        currentWeights: [81, 82, 80, 81, 82, 81, 80, 81, 82, 81],
      ),
      Member(
        name: "Miembro 2",
        lastWeight: 95.0,
        currentWeights: [94, 93, 94, 94, 92, 93, 94, 93, 94, 93],
      ),
      Member(
        name: "Miembro 3",
        lastWeight: 70.0,
        currentWeights: [72, 71, 72, 73, 72, 72, 71, 72, 73, 72],
      ),
      Member(
        name: "Miembro 4",
        lastWeight: 110.0,
        currentWeights: [108, 109, 107, 108, 108, 109, 108, 107, 108, 108],
      ),
      Member(
        name: "Miembro 5",
        lastWeight: 85.0,
        currentWeights: [85, 86, 85, 85, 87, 85, 86, 85, 85, 86],
      ),
    ];
  }
}

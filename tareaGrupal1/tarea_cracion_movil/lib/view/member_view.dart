import 'package:flutter/material.dart';
import '../model/member_model.dart';
import '../controller/member_controller.dart';

class MemberWeightView extends StatelessWidget {
  final MemberController controller = MemberController();

  @override
  Widget build(BuildContext context) {
    List<Member> members = controller.getMembers();

    return Scaffold(
      appBar: AppBar(title: Text("Control de Peso - Club")),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          final diff = member.weightDifference.abs();

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                member.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Promedio actual: ${member.averageWeight.toStringAsFixed(2)} kg",
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    member.status,
                    style: TextStyle(
                      color: member.status == "SUBIÓ"
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("${diff.toStringAsFixed(2)} kg"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

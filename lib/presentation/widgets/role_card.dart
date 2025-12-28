import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/agent/agent.dart';
import 'details_divider.dart';

class RoleCard extends StatelessWidget {
  final Agent agent;
  const RoleCard({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .all(16),
      padding: const .all(5),
      decoration: BoxDecoration(
        borderRadius: .circular(25),
        gradient: const LinearGradient(
          colors: [MyColors.myRed, MyColors.myLightGrey],
          begin: .topCenter,
          end: .bottomCenter,
        ),
      ),
      child: Container(
        padding: const .all(16),

        decoration: BoxDecoration(
          borderRadius: .circular(25),
          boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black)],
          gradient: const RadialGradient(
            colors: [MyColors.myRed, MyColors.myGrey],
            focalRadius: 2,
            center: .topCenter,
            radius: 0.8,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(agent.role!.displayIcon, height: 50, width: 50),
                const SizedBox(width: 12),
                Text(
                  agent.role!.displayName,
                  style: const TextStyle(
                    color: MyColors.myRed,
                    fontSize: 32,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const DetailsDivider(
              color: MyColors.myWhite,
              thickness: 3,
              endIndent: 20,
              indent: 20,
            ),

            const SizedBox(height: 10),
            Text(
              agent.role!.description,
              style: const TextStyle(color: MyColors.mySilver, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

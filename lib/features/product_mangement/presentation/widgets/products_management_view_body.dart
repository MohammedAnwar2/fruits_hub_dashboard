import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';

class PoroductsManagementViewBody extends StatelessWidget {
  const PoroductsManagementViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment:    MainAxisAlignment.center,
        spacing: 20,
        children: [
         CustomButton(
                text: "Add Products",
                onPressed: () {
                  Navigator.pushNamed(context,'');
                },
              ),
         CustomButton(
                text: "Update Products",
                onPressed: () {
                  Navigator.pushNamed(context,'');
                },
              ),
         CustomButton(
                text: "Delete Products",
                onPressed: () {
                  Navigator.pushNamed(context,'');
                },
              ),
         CustomButton(
                text: "View Products",
                onPressed: () {
                  Navigator.pushNamed(context,'');
                },
              ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> stepTitles;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepTitles,
  });

  Color getLeftColor(int index) {
    if (index == 0) {
      return Colors.transparent;
    } 

    if (currentStep > index + 1) {
      return LeezenColor.primary002.getTypeColor();
    }

    return LeezenColor.grey003.getTypeColor();
  }

  Color getRightColor(int index) {
    if (index == totalSteps - 1) {
      return Colors.transparent;
    }

    if (currentStep > index + 1) {
      return LeezenColor.primary002.getTypeColor();
    }

    return LeezenColor.grey003.getTypeColor();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: getLeftColor(index),
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor:
                            index < currentStep ? Colors.green : Colors.grey,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Divider(
                      color: getRightColor(index),
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                stepTitles[index],
                style: TextStyle(
                  color: index < currentStep
                      ? LeezenColor.primary002.getTypeColor()
                      : LeezenColor.grey003.getTypeColor(),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    );
  }
}

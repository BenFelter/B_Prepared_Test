import 'package:flutter/material.dart';
import 'package:frontend/models/test_models.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: TasksPage());

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = TestModels.getTasks();
    return Container(
        child: ListView(
      children: [
        for (final task in tasks) TaskTile(task: task),
      ],
    ));
  }
}

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Card(
        child: ListTile(
          minVerticalPadding: 13,
          leading: const TaskCircleCheckBox(), // AFASF
          trailing: const Text('past due',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300
                  //color: Colors.grey,
                  )), //date indicator
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                task.title,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
          subtitle: Text(
            task.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
          dense: true,
        ),
      ),
    ); // listtile for that index
  }
}

class TaskCircleCheckBox extends StatefulWidget {
  const TaskCircleCheckBox({Key? key}) : super(key: key);

  @override
  State<TaskCircleCheckBox> createState() => _TaskCircleCheckBoxState();
}

class _TaskCircleCheckBoxState extends State<TaskCircleCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }

    return Transform.scale(
      scale: 1.4,
      child: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        shape: const CircleBorder(
            side: BorderSide(
                width: 10) // doesn't do anything, trying to change border width
            ),
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}

// ignore_for_file: unnecessary_const
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:todo/model_task.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasksList = [];
  final TextEditingController textfeldcontroller = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> saveData() async {
    List<Map<String, dynamic>> tasksAsJson = [];
    List<String> tasksAsString = [];

    for (var element in tasksList) {
      tasksAsJson.add(element.toJson());
    }

    for (var element in tasksAsJson) {
      tasksAsString.add(jsonEncode(element));
    }
    final prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setStringList("tasks", tasksAsString);
    print("save data======== $res ");
  }

  Future<void> getData() async {
    List<String> tasksAsString = [];
    List<Map<String, dynamic>> tasksAsJson = [];

    tasksList.clear();
    final prefs = await SharedPreferences.getInstance();

    tasksAsString = prefs.getStringList("tasks") ?? [];

    for (var element in tasksAsString) {
      tasksAsJson.add(jsonDecode(element));
    }

    setState(() {
      for (var element in tasksAsJson) {
        tasksList.add(Task.fromJson(element));
      }
    });

    print(tasksList[0].title);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "this my todo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [Icon(Icons.logout)],
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 175, 168, 176),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person),
            ),
            ListTile(
              title: const Text("Home"),
              trailing: const Icon(
                Icons.house,
                color: Colors.black,
              ),
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ()));
              // },
            ),
            ListTile(
              title: const Text("Log in"),
              trailing: const Icon(
                Icons.login,
                color: Colors.black,
              ),
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ()));
              // },
            ),
            ListTile(
              title: const Text("Sign up"),
              trailing: const Icon(
                Icons.power_settings_new_outlined,
                color: Colors.black,
              ),
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ()));
              // },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 166, 219),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showformdialog(context), // Pass context
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "All todo",
            style: TextStyle(fontSize: 75,color: Color.fromARGB(255, 255, 255, 255)),
          ),
          tasksList.isEmpty
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 500,
                      child: Center(
                        child: Text("No tasks to display"),
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: tasksList.length,
                    itemBuilder: (context, index) {
                      final task = tasksList[index];
                      return Card(
                        child: ListTile(
                          title: Text(task.title),
                          leading: Checkbox(
                              value: task.isDone,
                              onChanged: (value) {
                                _handleToDoChange(tasksList[index]);
                              }),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline)),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  void showformdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textfeldcontroller,
                autocorrect: true,
                decoration: const InputDecoration(
                  labelText: 'enter todo',
                  hintText: '',
                  icon: Icon(Icons.add_alert),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 40,
              height: 30,
              child: FloatingActionButton.extended(
                onPressed: () {
                  _addToDoItem(textfeldcontroller.text);
                  Navigator.of(context).pop(); // Close the dialog
                },
                label: const Text("save"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 40,
              height: 30,
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.pop(context),
                label: const Text("close"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(Task todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    saveData();
  }

  void _addToDoItem(String toDo) {
    setState(() {
      var newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: toDo,
      );
      tasksList.add(newTask);
      saveData();
    });
    textfeldcontroller.clear();
  }
}

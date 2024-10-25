import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/exercise_provider.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exercise', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          List<String> exercises = ref.watch(exerciseListProvider);

          void _addExercise() {
            if (_controller.text.isNotEmpty) {
              ref.read(exerciseListProvider.notifier).state = [
                ...exercises,
                _controller.text,
              ];
              _controller.clear();
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Exercise',
                    hintText: 'Enter exercise name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addExercise,
                  child: Text('Add Exercise'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 77, 190, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 2,
                        child: ListTile(
                          title: Text(exercises[index], style: TextStyle(fontSize: 16)),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back to Home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 77, 175, 255),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

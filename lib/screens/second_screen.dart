import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/exercise_provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Exercises', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          List<String> exercises = ref.watch(exerciseListProvider);

          void _deleteExercise(int index) {
            ref.read(exerciseListProvider.notifier).state = [
              ...exercises..removeAt(index),
            ];
          }

          return exercises.isEmpty
              ? Center(
                  child: Text(
                    'No exercises to delete.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 2,
                        child: ListTile(
                          title: Text(exercises[index], style: TextStyle(fontSize: 16)),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                            onPressed: () => _deleteExercise(index),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Back to Home'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}

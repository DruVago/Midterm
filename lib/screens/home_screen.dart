import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'package:todolist/exercise_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> exercises = ref.watch(exerciseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Exercise List', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: exercises.isEmpty
          ? Center(
              child: Text(
                'No exercises added yet.',
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
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.add, size: 18),
              label: Text('Add Exercise'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 125, 238),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.delete_outline, size: 18),
              label: Text('Delete Exercise'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 114, 114),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

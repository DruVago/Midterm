import 'package:flutter_riverpod/flutter_riverpod.dart';

// State provider to manage a list of exercises
final exerciseListProvider = StateProvider<List<String>>((ref) => []);

import 'package:amplify_flutter/amplify.dart';
import 'models/ModelProvider.dart';


class AmplifyProcessing {
  static void addDataStore(name, desc) async {
    Todo item = Todo(name: name, description: desc);
    try {
      await Amplify.DataStore.save(item);
      print("DataStore Add Success");
    } catch (e) {
      print('DataStore Add failed: $e');
    }
  }
  
  static void deleteDataStore(Todo todo) async {
    try {
      await Amplify.DataStore.delete(todo);
      print("DataStore Delete Success");
    } catch (e) {
      print('DataStore Delete failed: $e');
    }
  }
}

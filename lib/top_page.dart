import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'amplify_processing.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    AmplifyDataStore _datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(_datastorePlugin);
    await Amplify.addPlugin(AmplifyAPI());

    try {
      await Amplify.configure(amplifyconfig);
      print("Amplify Configure Success");
      setState(() {
        _isAmplifyConfigured = true;
      });
    } on AmplifyAlreadyConfiguredException catch (e){
      print("Amplify Configure Exception : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAmplifyConfigured) {
      return Center(child: CircularProgressIndicator());
    }
    return MaterialApp(home: TodoList());
  }
}


class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amplify Datastore Demo'),
      ),
      body: Stack(
        children: [
          ListWidget(),
          InputBoxWidget(),
        ],
      ),
    );
  }
}

Widget ListWidget() {
  return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: StreamBuilder(
        stream: Amplify.DataStore.observeQuery(Todo.classType, throttleOptions: const ObserveQueryThrottleOptions.none()),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Todo>> snapshot){
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          QuerySnapshot<Todo> querySnapshot = snapshot.data!;
          if (querySnapshot.items.isEmpty) {
            return const Center(child: Text('データなし'));
          }
          return ListView.builder(
            itemCount: querySnapshot.items.length,
            itemBuilder: (context, index) {
              Todo todo = querySnapshot.items[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border( bottom: BorderSide(color: Colors.black)),
                ),
                child: ListTile(
                  title: Text(todo.name),
                  subtitle: Text(todo.description ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      AmplifyProcessing.deleteDataStore(todo);
                      print("削除");
                    },
                  ),
                ),
              );
            },
          );
        }, //builder
      ),
  );
}

Widget InputBoxWidget() {
  final textController = TextEditingController();

  return Align(
    alignment: Alignment.bottomCenter,
    child: Container( height: 60, color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '登録文字列',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                AmplifyProcessing.addDataStore(textController.text,"desciption");
              },
              child: Text('登録'),
            ),
          ),
        ],
      ),
    ),
  );
}


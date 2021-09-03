import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Too many clicks!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    store.selectError.addListener(_showError);
    super.initState();
  }

  @override
  void dispose() {
    store.selectError.removeListener(_showError);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (_, counter) {
          return Center(
            child: Text('Counter: $counter'),
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

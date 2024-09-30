import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AsyncExamplePage(),
    );
  }
}

class AsyncExamplePage extends StatefulWidget {
  @override
  _AsyncExamplePageState createState() => _AsyncExamplePageState();
}

class _AsyncExamplePageState extends State<AsyncExamplePage> {
  String _data = "Initial data";
  bool _isLoading = false;

  // Example of Future API: fetch data after delay
  Future<String> fetchDataWithFuture() {
    return Future.delayed(Duration(seconds: 3), () {
      return "Data fetched using Future API";
    });
  }

  // Example of async/await: fetch data after delay
  Future<void> fetchDataWithAsyncAwait() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _data = "Data fetched using async/await";
      _isLoading = false;
    });
  }

  // Simulating data saving using Future API
  Future<void> saveDataWithFuture() {
    return Future.delayed(Duration(seconds: 2), () {
      print("Data saved using Future API");
    });
  }


  Future<void> saveDataWithAsyncAwait() async {
    await Future.delayed(Duration(seconds: 2));
    print("Data saved using async/await");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Example'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_data),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String result = await fetchDataWithFuture();
                setState(() {
                  _data = result;
                });
              },
              child: Text('Fetch Data with Future API'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                fetchDataWithAsyncAwait();
              },
              child: Text('Fetch Data with async/await'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveDataWithFuture();
              },
              child: Text('Save Data with Future API'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                saveDataWithAsyncAwait();
              },
              child: Text('Save Data with async/await'),
            ),
          ],
        ),
      ),
    );
  }
}

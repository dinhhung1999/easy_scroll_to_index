import 'package:easy_scroll_to_index/easy_scroll_to_index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EasyScrollToIndexExample(),
    );
  }
}

class EasyScrollToIndexExample extends StatefulWidget {
  static const path = 'EasyScrollToIndexExample';
  @override
  EasyScrollToIndexExampleState createState() =>
      EasyScrollToIndexExampleState();
}

class EasyScrollToIndexExampleState extends State<EasyScrollToIndexExample> {
  static const TAG = 'EasyScrollToIndexExample';
  final ScrollToIndexController _controller = ScrollToIndexController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Scroll To Index Example'),
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          _controller.easyScrollToIndex(index: 50);
        },
        child: Container(
            color: Colors.amberAccent, child: const Text('Scroll to index 50')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyScrollToIndex(
              controller: _controller, // ScrollToIndexController
              scrollDirection: Axis.horizontal, // default Axis.vertical
              itemCount: 100, // itemCount
              itemWidth: 50,
              itemHeight: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(child: Text('item ' + index.toString())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

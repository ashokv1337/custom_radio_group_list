import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Map<dynamic, dynamic>> sampleList = [];

List<String> stringList = [
  'test1',
  'test2',
  'test3',
  'test4',
  'test5',
  'test7',
  'test8'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Radio Group List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Radio Group List Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    sampleList.add(SampleData(data: 'test1 Object', id: '1').toJson());
    sampleList.add(SampleData(data: 'test2 Object', id: '2').toJson());
    sampleList.add(SampleData(data: 'test3 Object', id: '3').toJson());
    sampleList.add(SampleData(data: 'test4 Object', id: '4').toJson());
    sampleList.add(SampleData(data: 'test5 Object', id: '5').toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Object List'),
              RadioGroup(
                  radioListObject: sampleList,
                  selectedItem: 1,
                  textParameterName: 'data',
                  onChanged: (value) {
                    // print('Value : ${value}');
                    final snackBar = SnackBar(content: Text("$value"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  disabled: false),
              const Text('String List Disabled selection'),
              RadioGroup(
                  radioList: stringList,
                  onChanged: (value) {
                    print('Value : ${value}');
                  },
                  selectedItem: 3,
                  disabled: true),
            ],
          ),
        ),
      ),
    );
  }
}

class SampleData {
  String id;
  String data;

  SampleData({required this.id, required this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['data'] = this.data;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

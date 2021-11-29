
# Custom Radio Group List
Flutter package to create list of radio button, by providing a list of objects it can be a String list or list of Map.


## Features

1. Radio list can be generated using a String list
2. Radio List can be generated using list of any Map object.
3. Selected item(String/Object) can be marked checked
4. List can be marked disabled so that user cannot change its value.
5. Scroll direction can be set to horizontal as well as vertical
6. TextSize and TextColor can be customized


## Getting started


In the `pubspec.yaml` of your flutter project, add the following dependency:
 ``` yaml dependencies:
 custom_radio_group_list: ^1.0.0
```
Import it to each file you use it in:
 ``` dart
 import 'package:custom_radio_group_list/custom_radio_group_list.dart';
 ```


## Usage

### Example 1
This example is very basic which uses list of string

 RadioGroup(
             radioList: sampleListString,
             selectedItem: 1,
             onChanged: (value) {
                print('Value : ${value}');
               },
             disabled: true)

### Example 2
This example shows use of Map object list to display radio group list.

         RadioGroup(
                    radioListObject: sampleList,
                    textParameterName: 'data',
                    selectedItem: 1,
                    onChanged: (value) {
                    print('Value : ${value}');
                    } )

Create Object like this 

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

In the above example we passed 'data' as parameter whose value needs to be displayed as text 
in radio group.

Please note that this parameter should be of type String.


## Additional information

Feel Free to report any issue and feature.


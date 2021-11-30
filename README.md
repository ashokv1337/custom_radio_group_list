
# Custom Radio Group List
Flutter package to create list of radio button, by providing a list of objects it can be a String list or list of Map.


## Features

1. Radio list can be generated using a String list
2. Radio List can be generated using list of any Map object.
3. Selected item(String/Object) can be marked checked
4. List can be marked disabled so that user cannot change its value.
5. Scroll direction can be set to horizontal as well as vertical
6. TextSize and TextColor can be customized

![A Sample image to display list of radio button](https://github.com/ashokv1337/custom_radio_group_list/raw/main/assets/asset1.png)

![A sample image to display value of selected object.](https://github.com/ashokv1337/custom_radio_group_list/raw/main/assets/asset2.png)



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
``` dart
 RadioGroup(
             radioList: sampleListString,
             selectedItem: 1,
             onChanged: (value) {
                print('Value : ${value}');
               },
             disabled: true)
  ```
### Example 2
This example shows use of Map object list to display radio group list.
``` dart
         RadioGroup(
                    radioListObject: sampleList,
                    textParameterName: 'data',
                    selectedItem: 1,
                    onChanged: (value) {
                    print('Value : ${value}');
                    } )
```
## Sample 

Please clone repository from 

https://github.com/ashokv1337/custom_radio_group_list

Go to example folder and see the sample implementation.


## Additional information

Feel Free to report any issue and feature.


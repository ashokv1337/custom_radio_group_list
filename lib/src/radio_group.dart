import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  /// List of String items to be shown
  final List<String>? radioList;

  /// List of Map items to be shown
  final List<Map<dynamic, dynamic>>? radioListObject;

  /// Function to detect selected radio button
  /// This returns selected map object or string
  final ValueChanged? onChanged;

  /// Index of Item to be set as selected
  final int? selectedItem;

  /// Mark list items as disabled.
  final bool disabled;

  /// Set scroll direction of list Default is vertical.
  final Axis scrollDirection;

  /// TextSize to be set.
  final double? textSize;

  /// TextColor to be set.
  final Color? textColor;

  /// Text key to be searched in Map Objects. Cannot be left is empty
  /// if list type is Map
  final String textParameterName;

  /// This widget creates s list of radio group widget
  /// So that you can easily implement List of radio buttons
  /// Just by passing a list of String or List of Map object.
  const RadioGroup(
      {Key? key,
      this.radioList,
      this.radioListObject,
      this.onChanged,
      this.selectedItem,
      this.disabled = false,
      this.scrollDirection = Axis.vertical,
      this.textSize,
      this.textColor,
      this.textParameterName = ''})
      : assert((textParameterName != '' && radioListObject != null) ||
            (textParameterName == '' && radioList != null) ||
            (selectedItem == null || selectedItem < 0)),
        super(key: key);
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State<RadioGroup> {
  int id = -1;
  bool isStringList = false;
  @override
  void initState() {
    super.initState();
    if (widget.selectedItem != null) {
      id = widget.selectedItem!;
    } else {
      id = -1;
    }
    if (widget.radioList is List<String> && widget.radioListObject == null) {
      isStringList = true;
    } else if (widget.radioListObject != null) {
      isStringList = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: widget.scrollDirection,
        shrinkWrap: true,
        itemCount: isStringList
            ? widget.radioList?.length
            : widget.radioListObject?.length,
        itemBuilder: (ctx, index) {
          dynamic data;
          String dataTextDisplayed = '';
          if (!isStringList) {
            var dataMap = widget.radioListObject![index];
            if (dataMap.containsKey(widget.textParameterName)) {
              data = dataMap;
              dataTextDisplayed = dataMap[widget.textParameterName];
            }
          } else {
            dataTextDisplayed = widget.radioList![index];
          }
          return RadioListTile<int>(
            // toggleable: ,
            title: Text(
              dataTextDisplayed,
              style: TextStyle(
                  fontSize: widget.textSize,
                  color: id == index ? widget.textColor : null),
            ),
            groupValue: id,
            value: index,
            onChanged: widget.disabled == true
                ? null
                : (val) {
                    if (widget.onChanged != null) {
                      widget.onChanged!(
                          isStringList ? widget.radioList![index] : data);
                    }
                    setState(() {
                      id = index;
                    });
                  },
          );
        });
  }
}

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';

class CustomDropDownSearch extends StatefulWidget {

  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController? dropdownSelectedName;
  final TextEditingController? dropdownSelectedID;

  const CustomDropDownSearch({super.key, required this.title, required this.listdata, this.dropdownSelectedName, this.dropdownSelectedID});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}


class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch(){
    DropDownState(
    DropDown(
      bottomSheetTitle:  Text(
      widget.title!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
    submitButtonChild: Text("Done",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    data: widget.listdata ?? [],
    onSelected: (List<dynamic> selectedList) {
        SelectedListItem selectedListItem = selectedList[0];

        widget.dropdownSelectedName?.text = selectedListItem.name;
        widget.dropdownSelectedID?.text = selectedListItem.value!;
        print("=================================\n ${widget.dropdownSelectedName?.text}");
        print("=================================\n ${widget.dropdownSelectedID?.text}");
    },
  ),
  ).showModal(context);
}
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
        hintText: widget.dropdownSelectedName!.text == ""? widget.title: widget.dropdownSelectedName!.text,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        label: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.primaryColor.withOpacity(0.3)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            widget.dropdownSelectedName!.text == ""? widget.title!: widget.dropdownSelectedName!.text,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        suffixIcon: InkWell(
          onTap: (){

          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.arrow_drop_down,
              color: AppColor.primaryColor,
              size: 22,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}

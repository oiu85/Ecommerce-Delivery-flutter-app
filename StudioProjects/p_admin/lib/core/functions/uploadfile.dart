

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p_admin/core/constant/color.dart';


imageUploadCamera()async{
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 90);
  if(file != null){
    return File(file.path);
  }else{
    return null;
  }

}

fileUploadGallery( [ isPng = false ])async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isPng
        ?["png", "PNG",]
        : ["svg", "SVG", "jpg", "JPG", "gif", "GIF", "wep", "WEP"]);

  if(result != null){
    return File(result.files.single.path!);
  }else{
    return null;
  }

}


showBottomMenu(Function() imageUploadCamera  , Function() fileUploadGallery ){

  Get.bottomSheet(
    Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text("219".tr,
                style: TextStyle(fontSize: 27, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              ListTile(
                onTap: (){
                  imageUploadCamera();
                  Get.back();
                },
                leading: const Icon(Icons.camera, size: 40,),
                title:  Text("257".tr, style: TextStyle(fontSize: 20),),
              ),
              ListTile(
                onTap: (){
                  fileUploadGallery();
                  Get.back();
                },
                leading: const Icon(Icons.image, size: 40,),
                title:  Text("258".tr, style: TextStyle(fontSize: 20),),
              )
            ]

          ),
        )
    )
  );
}







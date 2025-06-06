import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatedatabase.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customappbar.dart';

class HomePage extends  StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("home")),
    );
  }
}


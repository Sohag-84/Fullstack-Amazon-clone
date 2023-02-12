// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_text_field.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/global_variable.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "add-product";
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  String category = 'Mobiles';
  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  selectImages() async {
    final res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text("Add Product", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200.h,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200.h,
                          autoPlay: true,
                        ),
                      )
                    : InkWell(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10.r),
                          dashPattern: [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            height: 150.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.folder_open, size: 24.h),
                                SizedBox(height: 5.h),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 30.h),
                CustomTextField(
                  controller: productNameController,
                  hintText: "Product Name",
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 5,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: priceController,
                  hintText: "Price",
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: quantityController,
                  hintText: "Quantity",
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    underline: Container(),
                    value: category,
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: 'Sell',
                  onTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

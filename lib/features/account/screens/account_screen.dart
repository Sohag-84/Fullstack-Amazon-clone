// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widgets/bellow_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120.w,
                  height: 45.h,
                  color: Colors.black,
                ),
              ),
              Container(
                padding:  EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10.h),
          TopButtons(),
          SizedBox(height: 20.h),
          Orders(),
        ],
      ),
    );
  }
}

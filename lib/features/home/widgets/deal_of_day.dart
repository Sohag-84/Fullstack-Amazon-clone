// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 10.h, left: 10.w),
          child: Text(
            "Deal of the day",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Image.network(
          "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
          height: 220.h,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "\$999.0",
            style: TextStyle(fontSize: 18.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15.w, right: 40.w, top: 5.h),
          child: Text(
            "Camera",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 2.w),
              Image.network(
                "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 2.w),
              Image.network(
                "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 2.w),
              Image.network(
                "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 2.w),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h).copyWith(left: 15.w),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        )
      ],
    );
  }
}

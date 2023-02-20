// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
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
                      product!.images[0],
                      height: 220.h,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        "\$${product!.price}",
                        style: TextStyle(fontSize: 18.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.only(left: 15.w, right: 40.w, top: 5.h),
                      child: Text(
                        product!.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h)
                          .copyWith(left: 15.w),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "See all deals",
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}

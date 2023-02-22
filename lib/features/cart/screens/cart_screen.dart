// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../search/screens/search_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  navigateToSearchScreen(searchQuery) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: searchQuery,
    );
  }
  navigateToAddressScreen() {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42.h,
                  margin: EdgeInsets.only(left: 15.w),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(7.r),
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.search),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(top: 20.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.w),
                        ),
                        hintText: "Search product",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 42.h,
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25.h,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          AddressBox(),
          CartSubtotal(),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: CustomButton(
              text: "Proceed to buy ${user.cart.length} item",
              onTap: navigateToAddressScreen,
              color: Colors.yellow[600],
            ),
          ),
          SizedBox(height: 15.h),
          Divider(),
          SizedBox(height: 5.h),
          Expanded(
            child: ListView.builder(
                itemCount: user.cart.length,
                itemBuilder: (context, index) {
                  return CartProduct(index: index);
                }),
          )
        ],
      ),
      
    );
  }
}

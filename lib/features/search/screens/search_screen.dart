// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/search_product.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/global_variable.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? productList;
  final SearchServices searchServices = SearchServices();

  fetchSearchProduct() async {
    productList = await searchServices.fetchSearchedProduct(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  navigateToSearchScreen(searchQuery) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: searchQuery,
    );
  }

  @override
  void initState() {
    super.initState();
    fetchSearchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          centerTitle: true,
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
      body: productList == null
          ? Loader()
          : Column(
              children: [
                AddressBox(),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: productList!.length,
                    itemBuilder: (context, index) {
                      var productData = productList![index];
                      return SearchProduct(product: productData);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProducDetailsServices {
  rateProduct({
    required context,
    required Product product,
    required double rating,
  }) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse("$uri/api/rate-product"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          "id": product.id,
          "rating": rating,
        }),
      );
      httpErrorHandle(response: response, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

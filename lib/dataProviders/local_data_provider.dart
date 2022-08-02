import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'error/exceptions.dart';

class LocalDataProvider {
  SharedPreferences sharedPreferences;

  LocalDataProvider({required this.sharedPreferences});

  Future<void> cacheData({required String key,required dynamic data,}) {
    print("setting sharedPreferences");
    print("key $key");
    print('cached data is $data');
    return sharedPreferences.setString(key, json.encode(data));
  }

  dynamic getCachedData({required String key,required retrievedDataType,dynamic returnType,}) {
    try {
      if (sharedPreferences.getString(key) != null) {
        if (returnType == List) {
          final List<dynamic> data = json.decode(
            sharedPreferences.getString(key)??'',
          );

          return retrievedDataType.fromJsonList(data);
        } else if (returnType == String) {
          final dynamic data = json.decode(
            sharedPreferences.getString(key)??'',
          );

          return data;
        } else {
          final dynamic data = json.decode(
            sharedPreferences.getString(key)??'',
          );

          try {
            return retrievedDataType.fromJson(data);
          } catch (e) {
            return data;
          }
        }
      }
      else {
        throw CacheException();
      }
    } catch (_) {
      throw CacheException();
    }
  }

  Future<bool> clearCache({
    required String key,
  }) {
    return sharedPreferences.remove(key);
  }

/*  Future<bool> addToCart({
    required CartModel data,
  }) {
    if (sharedPreferences.getString('CACHED_CART') != null) {
      bool newItem = true;
      dynamic userCart = sharedPreferences.getString('CACHED_CART');
      // print(userCart);
      List<dynamic> cart = jsonDecode(userCart);

      cart.forEach((element) {
        if (element['name'] == data.name && element['id'].toString() == data.id && data.options.toString() == jsonDecode(element['options']).toString()) {
          element['amount'] = (int.parse(element['amount'].toString()) + int.parse(data.amount.toString()));
          newItem = false;
          return;
        }
      });
      if (newItem) {
        cart.add(data);
        newItem = false;
      }

      return sharedPreferences.setString('CACHED_CART', json.encode(cart));
    } else {
      List<CartModel> cart = [];
      cart.add(data);

      return sharedPreferences.setString('CACHED_CART', json.encode(cart));
    }
  }*/
}

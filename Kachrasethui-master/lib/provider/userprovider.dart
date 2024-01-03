import 'dart:convert';
import 'dart:io';
import 'package:kachrasethui/models/pickup.dart';
import 'package:kachrasethui/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<PickupModel> _pickUpData = [];
  List<PickupModel> get pickUpData => _pickUpData;
  UserModel userdata = UserModel();
  //function to post data on an api
  Future<void> postData(user) async {
    http.Response req = await http
        .post(
      Uri.parse('https://kachraseth.semikolan.co/register'),
      body: jsonEncode(
        {
          'name': user.displayName,
          'email': user.email,
          'profile_photo_path': user.photoURL
        },
      ),
    )
        .catchError((e) {
      print(e);
    });
    UserModel userSignedIn = UserModel.fromJson(jsonDecode(req.body));
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', userSignedIn.token);
    userdata = userSignedIn;
    // notifyListeners();
    print(userSignedIn.user?.name ?? '' + ' ' + userSignedIn.token);
  }

  //function to post pickup details from api
  static Future<void> postpickup(String address) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    print(address + "Adding");
    http.Response req = await http
        .post(
      Uri.parse('https://kachraseth.semikolan.co/add-pickup'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(
        {
          'address': address,
        },
      ),
    )
        .catchError((e) {
      print(e);
    });
    print('pickup added');
    // notifyListeners();
  }

  Future getPickupDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    print("Sending req with token" + token);
    http.Response req = await http.post(
      Uri.parse('https://kachraseth.semikolan.co/list-pickup'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token"
      },
    ).catchError((e) {
      print(e);
    });
    // _pickUpData = PickupModel.fromJson(jsonDecode(req.body));
    // print(req.body);
    List dt = jsonDecode(req.body);
    _pickUpData.clear();
    print(dt.toString() + "DT");
    for (var element in dt) {
      print("ADDEING" + element.toString());
      _pickUpData.add(PickupModel.fromJson(element));
    }
    print("PICKUP" + pickUpData.toString());
    notifyListeners();
  }
}

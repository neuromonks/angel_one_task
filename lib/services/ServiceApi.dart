import 'dart:convert';
import 'dart:io';
import 'package:angle_one_task/helper/HelperFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as Path;

class Url {
  static const String baseUrl = "https://api.mbsconnect.in/api/";
  static const String authBaseUrl = "auth/";
  static const String systemBaseUrl = "system/";
  static const String userBaseUrl = "user/";
}

class ServiceApi {
  static Future api(String url, String type, BuildContext context1,
      {bool headerWithTokenBool, var body, bool showSuccessFalseMsg}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> headerWithToken = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer ${preferences.getString(IConstant.userToken)}'
    };
    print(Url.baseUrl + url);
    // print(preferences.getString(IConstant.userToken));
    switch (type) {
      case "get":
        {
          try {
            final http.Response response = await http.get(
              Uri.parse(Url.baseUrl + url),
              headers: headerWithTokenBool == true ? headerWithToken : headers,
            );
            return checkResponse(response, context1,
                showSuccessFalseMsg: showSuccessFalseMsg);
          } on SocketException catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(
                context1, "Please check internet connection");
            return null;
          } catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(context1, "Something went wrong");
            return null;
          }
        }
        break;

      case "post":
        {
          try {
            final http.Response response = await http.post(
              Uri.parse(Url.baseUrl + url),
              headers: headerWithTokenBool == true ? headerWithToken : headers,
              body: body,
            );
            return checkResponse(response, context1,
                showSuccessFalseMsg: showSuccessFalseMsg);
          } on SocketException catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(
                context1, "Please check internet connection");
            return null;
          } catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(context1, "Something went wrong");
            return null;
          }
        }
        break;
      case "put":
        {
          try {
            final http.Response response = await http.put(
              Uri.parse(Url.baseUrl + url),
              headers: headerWithTokenBool == true ? headerWithToken : headers,
              body: body,
            );
            return checkResponse(response, context1,
                showSuccessFalseMsg: showSuccessFalseMsg);
          } on SocketException catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(
                context1, "Please check internet connection");
            return null;
          } catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(context1, "Something went wrong");
            return null;
          }
        }
        break;
      case "delete":
        {
          try {
            final http.Response response = await http.delete(
              Uri.parse(Url.baseUrl + url),
              headers: headerWithTokenBool == true ? headerWithToken : headers,
            );
            return checkResponse(response, context1,
                showSuccessFalseMsg: showSuccessFalseMsg);
          } on SocketException catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(
                context1, "Please check internet connection");
            return null;
          } catch (e) {
            debugPrint(e.toString());
            HelperFunction.showFlushbarError(context1, "Something went wrong");
            return null;
          }
        }
        break;
      default:
        {
          print('Wrong choice dude!!!');
        }
    }
  }

  static dynamic checkResponse(http.Response response, BuildContext context1,
      {bool showSuccessFalseMsg}) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        if (showSuccessFalseMsg != false && responseJson['success'] == false) {
          HelperFunction.showFlushbarError(
              context1, "${responseJson['message']}");
        }
        return responseJson;
      case 203:
        var responseJson = json.decode(response.body);
        HelperFunction.showFlushbarError(
            context1, "${responseJson['message']}");
        return null;
      case 404:
        HelperFunction.showFlushbarError(context1, "Server url not found");
        return null;
      case 412:
        var responseJson = json.decode(response.body.toString());
        Map<String, dynamic> data = responseJson['data'];
        String error = '';
        data.forEach((key, value) {
          error += value[0] + "\n";
        });
        HelperFunction.showFlushbarError(context1, "$error");
        return null;
      case 500:
        HelperFunction.showFlushbarError(
            context1, "Something went wrong on server");
        return null;
      default:
        throw null;
    }
  }

  static apiMultipart(String url, Map<String, String> body, File imageFile,
      BuildContext context1) async {
    var request = http.MultipartRequest('POST', Uri.parse(Url.baseUrl + url));
    var length = await imageFile.length();
    var stream = new http.ByteStream(Stream.castFrom(imageFile.openRead()));
    var pic = new http.MultipartFile("profile_image", stream, length,
        filename: Path.basename(imageFile.path));
    request.files.add(pic);
    request.fields.addAll(body);
    return checkResponse(
        await request
            .send()
            .then((response) => http.Response.fromStream(response)),
        context1);
  }

  static apiMultipartUpdateProfile(String url, Map<String, String> body,
      File imageFile, BuildContext context1) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    var request = http.MultipartRequest('POST', Uri.parse(Url.baseUrl + url));
    var length = await imageFile.length();
    var stream = new http.ByteStream(Stream.castFrom(imageFile.openRead()));
    var pic = new http.MultipartFile("profile_image", stream, length,
        filename: Path.basename(imageFile.path));
    request.files.add(pic);
    request.fields.addAll(body);
    request.headers.addAll({
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer ${preferences.getString(IConstant.userToken)}'
    });
    return checkResponse(
        await request
            .send()
            .then((response) => http.Response.fromStream(response)),
        context1);
  }
}

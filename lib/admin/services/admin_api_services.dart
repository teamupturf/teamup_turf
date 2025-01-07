import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class AdminApiServices {
  Future<List<dynamic>> getTurfs({required String status}) async {
    String getTurfsUrl =
        "https://turf-hur2.onrender.com/api/register/view-turfs";
    try {
      final response = await http.get(Uri.parse(getTurfsUrl));
      if (response.statusCode == 200) {
        final dataList = jsonDecode(response.body)['data'] as List;
        return dataList.where((turf) => turf['status'] == status).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getSingleTurf({required String turfId}) async {
    String getSingleTurfUrl =
        "https://turf-hur2.onrender.com/api/register/view-single-turf/$turfId";
    try {
      final response = await http.get(Uri.parse(getSingleTurfUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else {
        return {'message': 'No such turf found'};
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> approveTurf({required String turfId}) async {
    String approveTurfUrl =
        "https://turf-hur2.onrender.com/api/register/approve-turf/$turfId";
    try {
      final response = await http.get(Uri.parse(approveTurfUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return 'error occured';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> rejectTurf({required String turfId}) async {
    String rejectTurfUrl =
        "https://turf-hur2.onrender.com/api/register/reject-turf/$turfId";
    try {
      final response = await http.get(Uri.parse(rejectTurfUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['message'];
      } else {
        return 'Error occured';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> addNews(
      {required String title,
      required String news,
      required File image}) async {
    String addNewsUrl = "https://turf-hur2.onrender.com/api/news/add";
    try {
      var uri = Uri.parse(addNewsUrl);
      var request = http.MultipartRequest('POST', uri);
      var imageUrl = await http.MultipartFile.fromPath("imageUrl", image.path);
      request.files.add(imageUrl);
      request.fields['title'] = title;
      request.fields['news'] = news;
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        Map<String, dynamic> data = jsonDecode(responseBody);
        return data['message'];
      } else {
        return 'Error occured';
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> viewNews()async{
    String viewNewsUrl = "https://turf-hur2.onrender.com/api/news/view-news";
    try{
      final response = await http.get(Uri.parse(viewNewsUrl));
      if(response.statusCode == 200){
        final dataList = jsonDecode(response.body)['data'] as List;
        return dataList;
      }else{
        return [];
      }
    }catch(e){
      rethrow;
    }
  }
}

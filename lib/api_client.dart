import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'global.dart';

class ApiClient{
  Future<Uint8List> removeImageBackgroundApi(String imagePath) async{
    var apiReq = http.MultipartRequest(
      "POST",
      Uri.parse("https://api.remove.bg/v1.0/removebg")
    );

    apiReq.files.add(
      await http.MultipartFile.fromPath(
        "image_file",
        imagePath
      )
    );

    apiReq.headers.addAll(
      {
        "X-API-Key": apiKeyRemoveImageBackground
      }
    );

    final apiResponse = await apiReq.send();

    if(apiResponse.statusCode == 200){
      http.Response getTransparentImage = await http.Response.fromStream(apiResponse);
      return getTransparentImage.bodyBytes;
    }else{
      throw Exception("Error Occured: ${apiResponse.statusCode}");
    }
  }
}
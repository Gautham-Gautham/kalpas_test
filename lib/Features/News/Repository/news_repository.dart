import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kalpas_test/Models/news_model.dart';

class NewsRepository {
  Future<NewsModel?> fetchData() async {
    //5b92e449f56a4311bb3718444e7527ee
    //5b92e449f56a4311bb3718444e7527ee
    NewsModel? newsModel;
    try {
      String apiUrl =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5b92e449f56a4311bb3718444e7527ee";

      // Making the GET request
      final response = await http.get(Uri.parse(apiUrl));

      // Checking if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parsing the JSON response
        var data = json.decode(response.body);
        newsModel = NewsModel.fromJson(data);
        // Printing the data or processing it further
        print(data);
      } else {
        // If the request was not successful, print the error status code
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      // Catching any exceptions that might occur
      print("object");
      print("Error: $e");
    }
    return newsModel;
  }
}

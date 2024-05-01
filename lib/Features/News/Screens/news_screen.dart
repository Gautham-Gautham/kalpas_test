import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kalpas_test/Core/Common/snack_bar.dart';
import 'package:kalpas_test/Features/News/Controller/news_controller.dart';
import 'package:kalpas_test/main.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../../../Models/news_model.dart';

final favoriteList = StateProvider<List<Article>>(
  (ref) {
    return [];
  },
);

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  Future<void> fetchData() async {
    //5b92e449f56a4311bb3718444e7527ee
    //5b92e449f56a4311bb3718444e7527ee
    try {
      String apiUrl =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5b92e449f56a4311bb3718444e7527ee";

      // Making the GET request
      final response = await http.get(Uri.parse(apiUrl));

      // Checking if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parsing the JSON response
        var data = json.decode(response.body);

        // Printing the data or processing it further
        print(data);
      } else {
        // If the request was not successful, print the error status code
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      // Catching any exceptions that might occur
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
              body: ref.watch(newsDataProvider).when(
        data: (data) {
          if (data != null) {
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, index) {
                bool fav = false;
                Article article = data.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: BehindMotion(), children: [
                      SlidableAction(
                        backgroundColor: Colors.red.shade200,
                        onPressed: (BuildContext context) {
                          if (fav) {
                            customSnackbar(context, "Already Added to Favs",
                                isError: true);
                          } else {
                            // List<Article> favArt = [];
                            // favArt.addAll(ref.watch(favoriteList));
                            // favArt.add(article);
                            ref.read(favoriteList).add(article);
                            customSnackbar(context, "Added Successfully");
                            print(ref.watch(favoriteList).length);
                            fav = true;
                          }
                        },
                        icon: Icons.favorite,
                        label: "Add to\nFavorite",
                        foregroundColor: Colors.red,
                      )
                    ]),
                    child: InkWell(
                      onTap: () {
                        print("hhhhhhhaaaaaaaaaaiiiiiiiiiiiiiiiiiiii");
                      },
                      child: Card(
                        child: SizedBox(
                          height: h * 0.15,
                          width: w,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: h * 0.01,
                                bottom: h * 0.01,
                                left: w * 0.02),
                            child: Row(
                              children: [
                                Container(
                                  height: h * 0.15,
                                  width: w * 0.29,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(article.urlToImage),
                                          fit: BoxFit.cover),
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(w * 0.02)),
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: w * 0.6,
                                      child: Text(
                                        article.title.substring(0, 60) + "...",
                                        style: TextStyle(
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: w * 0.6,
                                      child: Text(
                                        article.description.length <= 48
                                            ? article.description
                                            : article.description
                                                    .substring(0, 60) +
                                                "...",
                                        style: TextStyle(fontSize: w * 0.035),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.grey,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    child: Card(
                      child: SizedBox(
                        height: h * 0.15,
                        width: w,
                      ),
                    ),
                    baseColor: Colors.blue.shade100.withOpacity(1),
                    // baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[100]!,
                  ),
                );
              },
            );
          }
        },
        error: (error, stackTrace) {
          print("object");
        },
        loading: () {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  child: Card(
                    child: SizedBox(
                      height: h * 0.15,
                      width: w,
                    ),
                  ),
                  baseColor: Colors.blue.shade100.withOpacity(1),
                  // baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[100]!,
                ),
              );
            },
          );
        },
      ))),
    );
  }
}

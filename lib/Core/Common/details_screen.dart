import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalpas_test/Models/news_model.dart';
import 'package:kalpas_test/main.dart';

class DetailsScreen extends StatefulWidget {
  final Article article;
  final bool fav;
  const DetailsScreen({super.key, required this.article, required this.fav});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new)),
                Text("Back")
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: h * 0.3,
                        width: w,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.article.urlToImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(w * 0.05)),
                        // child: Image.network(
                        //   widget.article.urlToImage,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      widget.fav == true
                          ? Positioned(
                              top: h * 0.01,
                              right: w * 0.03,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: w * 0.09,
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  SizedBox(
                      width: w,
                      child: Text(
                        widget.article.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w * 0.05),
                      )),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                      Text(
                        DateFormat("EEE,").format(widget.article.publishedAt),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Text(
                          DateFormat("dd MMM yyyy")
                              .format(widget.article.publishedAt),
                          style: TextStyle(color: Colors.grey.shade600)),
                      Text(
                          DateFormat("HH:mm:ss")
                                  .format(widget.article.publishedAt) +
                              "GMT",
                          style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  SizedBox(
                    width: w,
                    child: Text(widget.article.content),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

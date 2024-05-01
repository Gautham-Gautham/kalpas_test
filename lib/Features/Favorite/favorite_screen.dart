import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:kalpas_test/Core/Common/details_screen.dart';
import 'package:kalpas_test/Features/News/Screens/news_screen.dart';
import '../../Core/Common/snack_bar.dart';
import '../../Models/news_model.dart';
import '../../main.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: ref.watch(favoriteList).isEmpty
            ? const Center(
                child: Text("No Favs"),
              )
            : Consumer(
                builder: (context, ref, child) {
                  return ListView.builder(
                    itemCount: ref.watch(favoriteList).length,
                    itemBuilder: (context, index) {
                      bool fav = false;
                      Article article = ref.watch(favoriteList)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slidable(
                          endActionPane:
                              ActionPane(motion: BehindMotion(), children: [
                            SlidableAction(
                              backgroundColor: Colors.red.shade200,
                              onPressed: (BuildContext context) {
                                // if (fav) {
                                //   customSnackbar(context, "Already Added to Favs",
                                //       isError: true);
                                // } else {
                                ref.read(favoriteList).remove(article);
                                customSnackbar(context, "Removed Successfully");
                                //   fav = true;
                                // }
                                setState(() {});
                              },
                              icon: Icons.delete_forever,
                              label: "Remove From\nFavorite",
                              foregroundColor: Colors.red,
                            )
                          ]),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      article: article,
                                      fav: true,
                                    ),
                                  ));
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
                                                image: NetworkImage(
                                                    article.urlToImage),
                                                fit: BoxFit.cover),
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                w * 0.02)),
                                      ),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: w * 0.6,
                                            child: Text(
                                              article.title.substring(0, 60) +
                                                  "...",
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
                                              style: TextStyle(
                                                  fontSize: w * 0.035),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                DateFormat("EEE,").format(
                                                    article.publishedAt),
                                                style: TextStyle(
                                                    fontSize: w * 0.03,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                  DateFormat("dd MMM yyyy")
                                                      .format(
                                                          article.publishedAt),
                                                  style: TextStyle(
                                                      fontSize: w * 0.03,
                                                      color: Colors
                                                          .grey.shade600)),
                                              Text(
                                                  DateFormat("HH:mm:ss").format(
                                                          article.publishedAt) +
                                                      "GMT",
                                                  style: TextStyle(
                                                      fontSize: w * 0.03,
                                                      color: Colors
                                                          .grey.shade600)),
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
                },
              ),
      )),
    );
  }
}

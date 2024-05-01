import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_test/Features/Favorite/favorite_screen.dart';
import 'package:kalpas_test/Features/News/Screens/news_screen.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screenIndx = StateProvider(
    (ref) => 0,
  );
  // int screenIndx = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        int indx = ref.watch(screenIndx);
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            body: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                body: Column(
                  children: [
                    SizedBox(
                      height: h * 0.02,
                    ),
                    // TabBar(
                    //   dividerColor: Colors.transparent,
                    //   indicatorColor: Colors.transparent,
                    //   tabs: [
                    //     SizedBox(
                    //       height: h * 0.05,
                    //       width: w * 0.5,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             Icons.menu,
                    //             size: w * 0.1,
                    //           ),
                    //           Text(
                    //             "News",
                    //             style: TextStyle(fontSize: w * 0.07),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: h * 0.05,
                    //       width: w * 0.5,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             Icons.favorite,
                    //             color: Colors.red,
                    //             size: w * 0.1,
                    //           ),
                    //           Text(
                    //             "Fav",
                    //             style: TextStyle(fontSize: w * 0.07),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: h * 0.1,
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              ref.read(screenIndx.notifier).update(
                                    (state) => 0,
                                  );
                            },
                            child: Container(
                              height: h * 0.07,
                              width: w * 0.4,
                              decoration: BoxDecoration(
                                  color: indx == 0
                                      ? Colors.blue.shade100
                                      : Colors.transparent,
                                  borderRadius:
                                      BorderRadius.circular(w * 0.03)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: w * 0.08,
                                  ),
                                  Text(
                                    "News",
                                    style: TextStyle(
                                        fontSize: w * 0.06,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(screenIndx.notifier).update(
                                    (state) => 1,
                                  );
                            },
                            child: Container(
                              height: h * 0.07,
                              width: w * 0.4,
                              decoration: BoxDecoration(
                                  color: indx == 1
                                      ? Colors.blue.shade100
                                      : Colors.transparent,
                                  borderRadius:
                                      BorderRadius.circular(w * 0.03)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: w * 0.08,
                                  ),
                                  Text(
                                    "Fav",
                                    style: TextStyle(
                                        fontSize: w * 0.06,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: indx == 0 ? NewsScreen() : FavoriteScreen(),
                    ),
                  ],
                ), // TabBarView
              ), // Scaffold
            ),
          )),
        );
      },
    );
  }
}

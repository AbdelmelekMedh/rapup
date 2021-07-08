import 'package:flutter/material.dart';
import 'package:rapup/widgets/CategoriesScroller.dart';
import 'package:rapup/widgets/carousel_loading.dart';
import 'package:rapup/widgets/search_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  final CategoriesScroller categoriesScroller = CategoriesScroller();
  String query = '';
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body:Stack(
        children:<Widget> [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF3F2F2),
                  Color(0xFFF93B3B),
                  Color(0xFFE7680D),
                  Color(0xFF8B7C71),
                ],
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
              children:<Widget> [
                SizedBox(height: MediaQuery.of(context).size.height - 700),//55
                Center(
                  child: Text(' Explore ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                buildSearch(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 17, 0, 10),
                  child: Text('#Trends'),
                ),
                CarouselLoading(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#Rap_Battle'),
                          Text('73.4 M',style: TextStyle(fontSize: 12,color: Colors.transparent.withOpacity(0.4))),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width - 385),//10
                      SmoothStarRating(
                        starCount:1,
                        color: Colors.yellow,
                        size:30,
                        //isReadOnly: true,
                        borderColor: Colors.yellow,
                        allowHalfRating: false,
                      ),
                    ],
                  ),
                ),
                categoriesScroller,
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('#Punchline'),
                      Text('73.4 M',style: TextStyle(fontSize: 12,color: Colors.transparent.withOpacity(0.4))),
                    ],
                  ),
                ),
                categoriesScroller,
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#Performances'),
                          Text('73.4 M',style: TextStyle(fontSize: 12,color: Colors.transparent.withOpacity(0.4))),
                        ],
                      ),
                ),
                categoriesScroller,
                SizedBox(height: MediaQuery.of(context).size.height - 665),//80
              ],
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Search',
    onChanged: searchvideo,
  );

  void searchvideo(String query) {
  }

}

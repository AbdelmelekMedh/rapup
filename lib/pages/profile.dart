import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/common/utils.dart';
import 'package:rapup/services/shared_service.dart';
import 'package:rapup/widgets/app_bar.dart';
import 'package:rapup/widgets/profile_tab_bar.dart';
import 'package:rapup/widgets/profile_widgets.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    //LoginResponseModel logResModel;
    var _screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: RapupAppBar(
        backgroundColor: Colors.black26,
        height: MediaQuery.of(context).size.height/10,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Abdelmelek Medhioub',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            FontAwesomeIcons.signOutAlt,
            color: Colors.white,
          ),
          onPressed: () {
            SharedService.logout(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                profileStats(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bio(context),
                    editProfile(context),
                  ],
                ),
              ],
            ),
            follow(screen: _screen),
            ProfileTabBar(
              height: MediaQuery.of(context).size.height/8,
              onTap: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
            ),
            StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: _pageIndex != 1 ? 3 : 2,
              itemCount: Utils.listOfImageUrl.length,
              itemBuilder: (contex, index) {
                return Container(
                  padding:
                  _pageIndex == 1 ? EdgeInsets.all(5) : EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: _pageIndex == 1
                        ? BorderRadius.circular(15)
                        : BorderRadius.circular(0),
                    child: Image(
                      fit: BoxFit.cover,
                      image:
                      NetworkImage(Utils.listOfImageUrl.elementAt(index)),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.count(
                  _pageIndex != 1 ? 1 : 1, _pageIndex != 1 ? 1 : 1.5),
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/api/profile_api.dart';
import 'package:rapup/common/utils.dart';
import 'package:rapup/models/login_model.dart';
import 'package:rapup/models/profile_model.dart';
import 'package:rapup/services/shared_service.dart';
import 'package:rapup/widgets/app_bar.dart';
import 'package:rapup/widgets/profile_tab_bar.dart';
import 'package:rapup/widgets/profile_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _pageIndex = 0;
  late final Future<ProfileScreenData> _screenFuture;

  @override
  void initState() {
    super.initState();
    _screenFuture = SharedService.loginDetails().then((details) async {
      if (details == null) {
        throw Exception("User not logged in");
      }
      await ProfileApi.createProfile(details.token, details.id, DateTime.now());
      final profile = await ProfileApi.getProfile(details.token, details.id);

      return ProfileScreenData(details, profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    final isStaggered = _pageIndex == 1;

    return FutureBuilder<ProfileScreenData?>(
        future: _screenFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: const Text('Error'),
                backgroundColor: Colors.black,
              ),
              body: const Center(
                child: Text(
                  'Could not load profile. Please try again.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }

          final userProfile = snapshot.data!;


          return Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            extendBody: false,
            appBar: RapupAppBar(
              height: MediaQuery.of(context).size.height / 10,
              leading: const SizedBox.shrink(),
              center: Text(
                '@${userProfile.details.username}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.black,
                ),
                onPressed: () {
                  SharedService.logout(context);
                },
              ),
            ),
            body:Stack(
              children: <Widget>[
            Container(
            decoration: const BoxDecoration(
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
          Form(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 70),
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
                            bio(context, '${userProfile.profile?.name}', '${userProfile.profile?.bio}'),
                            editProfile(context),
                          ],
                        ),
                      ],
                    ),
                    follow(screen: _screen),
                    ProfileTabBar(
                      height: MediaQuery.of(context).size.height / 8,
                      onTap: (value) {
                        setState(() {
                          _pageIndex = value;
                        });
                      },
                    ),
                    StaggeredGridView.countBuilder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: isStaggered ? 2 : 3,
                      itemCount: Utils.listOfImageUrl.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: isStaggered
                              ? const EdgeInsets.all(5)
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: isStaggered
                                ? BorderRadius.circular(15)
                                : BorderRadius.zero,
                            child: Image.network(
                              Utils.listOfImageUrl.elementAt(index),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) =>
                          StaggeredTile.count(1, isStaggered ? 1.0 : 1.5),
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                  ],
                ),
              ),
            ),
                  ],
            ),
          );
        });
  }
}

class ProfileScreenData {
  final LoginResponseModel details;
  final ProfileModel? profile;

  ProfileScreenData(this.details, this.profile);
}

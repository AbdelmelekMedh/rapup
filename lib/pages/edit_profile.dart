import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/api/profile_api.dart';
import 'package:rapup/pages/profile.dart';
import 'package:rapup/services/shared_service.dart';
import 'package:rapup/widgets/app_bar.dart';
import 'package:rapup/widgets/profile_widgets.dart';
import 'package:rapup/widgets/text_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  //late final Future<ProfileScreenData> _screenFuture;
  late final TextEditingController _fullNameController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _bioController;
  late final TextEditingController _socialLinksController;
  late final TextEditingController _interestsController;
  late final TextEditingController _languagesController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _bioController = TextEditingController();
    _socialLinksController = TextEditingController();
    _interestsController = TextEditingController();
    _languagesController = TextEditingController();
    /*_screenFuture = SharedService.loginDetails().then((details) async {
      if (details == null) {
        throw Exception("User not logged in");
      }
      await ProfileApi.createProfile(details.token, details.id, DateTime.now());
      final profile = await ProfileApi.getProfile(details.token, details.id);

      return ProfileScreenData(details, profile);
    });*/
  }
  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: RapupAppBar(
        leading: BackButton(color: Colors.black),
        center: Text("Edit Profile",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        height: MediaQuery.of(context).size.height/10,
        trailing: IconButton(
            icon: const Icon(
              FontAwesomeIcons.check,
              color: Colors.black,
            ),
            onPressed: () {},
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
            child:
            SingleChildScrollView(
              padding:  EdgeInsets.fromLTRB(10, 80, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  TextWidget(
                    controller: _fullNameController,
                    label: 'Full Name',
                    icon: FontAwesomeIcons.user,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  TextWidget(
                    controller: _addressController,
                    label: 'Address',
                    icon: FontAwesomeIcons.addressCard,
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  TextWidget(
                    controller: _phoneNumberController,
                    label: 'Phone Number',
                    icon: FontAwesomeIcons.phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  TextWidget(
                    controller: _bioController,
                    label: 'Bio',
                    icon: FontAwesomeIcons.book,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  TextWidget(
                    controller: _socialLinksController,
                    label: 'Social Links',
                    icon: FontAwesomeIcons.link,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                  ),
                  TextWidget(
                    controller: _interestsController,
                    label: 'Interests',
                    icon: FontAwesomeIcons.heart,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                  ),
                  TextWidget(
                    controller: _languagesController,
                    label: 'Languages',
                    icon: FontAwesomeIcons.language,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

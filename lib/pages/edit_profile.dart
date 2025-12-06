import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/pages/profile.dart';
import 'package:rapup/widgets/app_bar.dart';
import 'package:rapup/widgets/gradient_container.dart';
import 'package:rapup/widgets/text_widget.dart';

class EditProfile extends StatefulWidget {
  final ProfileScreenData userProfile;

  const EditProfile({Key? key, required this.userProfile}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _bioController = TextEditingController();
  final _socialLinksController = TextEditingController();
  final _interestsController = TextEditingController();
  final _languagesController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedGender;
  final List<String> _listGender = ["Male", "Female", "Other"];

  @override
  void initState() {
    super.initState();
    final profile = widget.userProfile.profile;
    if (profile != null) {
      _fullNameController.text = profile.name ?? '';
      _addressController.text = profile.address ?? '';
      _phoneNumberController.text = profile.phoneNumber ?? '';
      _bioController.text = profile.bio ?? '';
      /*_socialLinksController.text = profile.socialLinks.links.entries
          .map((e) => '${e.key}:${e.value}')
          .join(', ') ?? '';*/

      _interestsController.text = profile.interests != null
          ? profile.interests.join(', ')
          : '';
      _languagesController.text = profile.languages != null
          ? profile.languages.join(', ')
          : '';
      if (profile.dateOfBirth != null) {
        _selectedDate = profile.dateOfBirth;
      }
      if (_listGender.contains(profile.gender)) {
        _selectedGender = profile.gender;
      }
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _bioController.dispose();
    _socialLinksController.dispose();
    _interestsController.dispose();
    _languagesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.userProfile.profile;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: RapupAppBar(
        leading: const BackButton(color: Colors.black),
        center: const Text("Edit Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        height: MediaQuery.of(context).size.height / 10,
        trailing: IconButton(
          icon: const Icon(
            FontAwesomeIcons.check,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: <Widget>[
          const GradientContainer(),
          Form(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 80, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              profile?.imageProfile.filePathUrl ?? 'https://via.placeholder.com/150'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                            ),
                            child: IconButton(
                              icon: const Icon(FontAwesomeIcons.camera, color: Colors.white),
                              onPressed: () {
                                // TODO: Implement image picker
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextWidget(
                    controller: _fullNameController,
                    label: 'Full Name',
                    icon: FontAwesomeIcons.user,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    controller: _addressController,
                    label: 'Address',
                    icon: FontAwesomeIcons.addressCard,
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    controller: _phoneNumberController,
                    label: 'Phone Number',
                    icon: FontAwesomeIcons.phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    controller: _bioController,
                    label: 'Bio',
                    icon: FontAwesomeIcons.book,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    controller: _socialLinksController,
                    label: 'Social Links',
                    icon: FontAwesomeIcons.link,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    controller: _interestsController,
                    label: 'Interests',
                    icon: FontAwesomeIcons.heart,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    controller: _languagesController,
                    label: 'Languages',
                    icon: FontAwesomeIcons.language,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Text('Date of birth', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () => _selectDate(context),
                              child: Row(
                                spacing: 15,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 3),
                                    child: Icon(FontAwesomeIcons.calendarDays, color: Colors.black54),
                                  ),
                                  Text(
                                    _selectedDate == null
                                        ? 'Select Date'
                                        : '${_selectedDate!.toLocal()}'.split(' ')[0],
                                    style: const TextStyle(color: Colors.black54, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  const SizedBox(height: 20),
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              spacing: 15,
                              children: [
                                Icon(FontAwesomeIcons.venusMars, size: 20, color: Colors.black54,),
                                DropdownButton<String>(
                                  hint: const Text('Select Gender'),
                                  dropdownColor: Colors.white.withOpacity(0.8),
                                  iconSize: 30,
                                  underline: const SizedBox(),
                                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                                  value: _selectedGender,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedGender = newValue;
                                    });
                                  },
                                  items: _listGender
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
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

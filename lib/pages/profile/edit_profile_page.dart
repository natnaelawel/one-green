import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firestore_example/pages/profile/button_widget.dart';
import 'package:flutter_firestore_example/pages/profile/profile_widget.dart';
import 'package:flutter_firestore_example/utils/user_preferences.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = "/editProfile";

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker _picker = new ImagePicker();

  Map<String, dynamic> _formData = <String, dynamic>{
    'companyName': '???',
    'city': "",
    'street': "",
    'addressLine': "",
  };

  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';

  late double latitude;
  late double longitude;
  bool locationSelected = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.moon_stars),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildProfilePhotoField(),
                SizedBox(
                  height: 20.0,
                ),
                _buildFirstNameField(),
                SizedBox(
                  height: 20.0,
                ),
                _buildLastNameField(),
                SizedBox(
                  height: 20.0,
                ),
                _buildPhoneFiled(),
                SizedBox(
                  height: 20.0,
                ),
                _buildHouseNumberField(),
                SizedBox(
                  height: 20.0,
                ),
                _buildWorkingDay(),
                SizedBox(
                  height: 20.0,
                ),
                _buildDomainChoice(),
                SizedBox(
                  height: 20.0,
                ),
                _buildGetLocation(),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePhotoField() {
    // final user = UserPreferences.myUser;
    return Stack(
      children: <Widget>[
        ProfileWidget(
          imagePath: 'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
          onClicked: () async {},
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => _buildBottomSheet(),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 28.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              )
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
    });
    // print(_imageFile.path + ' profile page');
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      controller: _firstNameController,
      validator: (value) => value!.isEmpty ? 'First Name is required' : null,
      onSaved: (value) => _firstName = value!,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        isCollapsed: true,
        labelText: "First Name",
        hintText: 'Bekele',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      controller: _firstNameController,
      validator: (value) => value!.isEmpty ? 'Last Name cannot be empty' : null,
      onSaved: (value) => _firstName = value!,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        isCollapsed: true,
        labelText: "Last Name",
        hintText: 'Petros',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _buildPhoneFiled() {
    return TextFormField(
      controller: _phoneController,
      // validator: (value) => value.isEmpty ? 'Last Name cannot be empty' : null,
      onSaved: (value) => _phone = value!,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        isCollapsed: true,
        labelText: "Tele Phone",
        hintText: '0912345678',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _buildHouseNumberField() {
    return TextFormField(
      controller: _firstNameController,
      validator: (value) =>
          value!.isEmpty ? 'House Number cannot be empty' : null,
      onSaved: (value) => _firstName = value!,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        isCollapsed: true,
        labelText: "House Number",
        hintText: '2532',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _buildWorkingDay() {
    List<String> workingDays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday"
    ];
    final _items =
        workingDays.map((day) => MultiSelectItem<String>(day, day)).toList();
    return MultiSelectChipField(
      items: _items,
      scroll: true,
      height: 100,
      initialValue: [""],
      title: Text("Available Days"),
      headerColor: Colors.blue.withOpacity(0.2),
      decoration: BoxDecoration(
        border: Border.all(width: 1.8),
      ),
      selectedChipColor: Colors.blue.shade300,
      selectedTextStyle: TextStyle(color: Colors.white),
      onTap: (values) {
        //_selectedAnimals4 = values;
      },
    );
  }

  Widget _buildDomainChoice() {
    List<String> _places = [
      "Bole",
      "Addis Ketema",
      "Gulele",
      "Arada",
      "Bole Lemi",
      "Bole",
      "Addis Ketema",
      "Gulele",
      "Arada",
      "Bole Lemi",
      "Bole",
      "Addis Ketema",
      "Gulele",
      "Arada",
      "Bole Lemi",
    ];
    final _items =
        _places.map((place) => MultiSelectItem<String>(place, place)).toList();
    return MultiSelectDialogField(
      items: _items,
      chipDisplay: MultiSelectChipDisplay(),
      height: MediaQuery.of(context).size.height * 0.5,
      searchable: true,
      title: Text("Address"),
      selectedColor: Colors.blue,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.01),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          // color: Colors.blue,
          width: 1,
        ),
      ),
      // buttonIcon: Icon(
      //   Icons.place,
      //   color: Colors.blue,
      // ),
      buttonText: Text(
        "Address",
        style: TextStyle(height: 2.0),
      ),
      onConfirm: (results) {
        //_selectedAnimals = results;
      },
    );
  }

  Widget _buildGetLocation() {
    return ListTile(
      title: Text('Choose Location'),
      trailing: IconButton(
        color: Colors.blue,
        iconSize: 30,
        icon: Icon(locationSelected ? Icons.mark_chat_read : Icons.map_rounded),
        onPressed: () {},
      ),
      onTap: () => getLocation(),
    );
  }

  getLocation() async {
    locationSelected = true;
    await Geolocator.checkPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
    setState(() {});
    final coordinates = new Coordinates(position.latitude, position.longitude);

    latitude = coordinates.latitude;
    longitude = coordinates.longitude;

    _showToast();
  }

  void _showToast() {
    ScaffoldMessenger.maybeOf(context)!.showSnackBar(
      SnackBar(
        content: const Text('Location Selected!'),
      ),
    );
  }

  Widget _buildSubmitButton() => ButtonWidget(
        text: "Submit",
        onClicked: () {},
      );
}

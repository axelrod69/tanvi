import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../authentication/network.dart';
import '../model/location/location.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../model/profile/profileProvider.dart';
import '../model/address/addressProvider.dart';
import './onBoardingScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Profile extends StatefulWidget {
  final String defaultAddress;
  ProfileState createState() => ProfileState();

  Profile(this.defaultAddress);
}

class ProfileState extends State<Profile> {
  bool isLoading = true;
  var index = 0;
  String? address;
  File? image;
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    Provider.of<AddressProvider>(context, listen: false)
        .getDefaultAddress()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Future pickImage(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source);
      final imageTemporary = File(img!.path);
      print('Temp Image: $imageTemporary');
      setState(() {
        image = imageTemporary;
        print('Image $image');
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<LocationProvider>(context).addressData;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;
    final defaultAddressProvider =
        Provider.of<AddressProvider>(context).defaultAddress;

    // for (index in provider['data']) {
    //   if (provider['data'][index]['is_default'] == true) {
    //     address =
    //         '${provider['data'][index]['address_line']}, ${provider['data'][index]['locality']}, ${provider['data'][index]['city']}, ${provider['data'][index]['postcode']}, ${provider['data'][index]['state']}';
    //   }
    // }

    // TODO: implement build
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.green,
            ))
          : Container(
              height: height * 1,
              width: width * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 392.png'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: !tabLayout && !largeLayout
                            ? height * 0.05
                            : height * 0.07,
                        // color: Colors.red,
                        margin: EdgeInsets.only(top: height * 0.02),
                        padding: EdgeInsets.only(left: width * 0.01),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Container(
                                // width: width * 0.95,
                                height: height * 0.1,
                                padding: EdgeInsets.only(
                                    right: tabLayout
                                        ? width * 0.12
                                        : width * 0.06),
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Profile',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout ? 30 : 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                height: height * 0.1,
                                padding: EdgeInsets.only(right: width * 0.02),
                                // color: Colors.amber,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: logout,
                                        child: Icon(Icons.logout_rounded,
                                            size: tabLayout ? 30 : 24))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: !tabLayout && !largeLayout
                            ? height * 0.54
                            : height * 0.5,
                        // color: Colors.red,
                        padding: EdgeInsets.only(
                            left: tabLayout ? width * 0.08 : width * 0.04,
                            right: tabLayout ? width * 0.08 : width * 0.04,
                            bottom: !tabLayout && !largeLayout
                                ? height * 0.05
                                : height * 0.02),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: height * 0.35,
                                  padding: EdgeInsets.only(top: height * 0.08),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${profileProvider['data']['first_name']} ${profileProvider['data']['last_name']}',
                                        // // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 55
                                                : largeLayout
                                                    ? 30
                                                    : 20),
                                      ),
                                      Text(
                                        '${profileProvider['data']['email']}',
                                        // // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: tabLayout ? 35 : 14),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          // color: Colors.blue,
                                          child: Column(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                fit: FlexFit.tight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => changeEmail(
                                                          context,
                                                          profileProvider),
                                                      child: Container(
                                                        width: width * 0.4,
                                                        height: !tabLayout &&
                                                                !largeLayout
                                                            ? height * 0.05
                                                            : height * 0.045,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      Offset(
                                                                          0, 2))
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Colors
                                                                    .green)),
                                                        child: Center(
                                                          child: Text(
                                                            'Change Email',
                                                            // textScaleFactor:
                                                            // textScaleFactor,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: tabLayout
                                                                    ? 20
                                                                    : largeLayout
                                                                        ? 14
                                                                        : 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: width * 0.02),
                                                    InkWell(
                                                      onTap: () async {
                                                        pickImage(ImageSource
                                                                .gallery)
                                                            .then((_) {
                                                          Provider.of<ProfileProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .updateProfilePicture(
                                                                  image)
                                                              .then((_) {
                                                            setState(() {
                                                              Provider.of<ProfileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .getProfileDetails();
                                                            });
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                          width: width * 0.4,
                                                          height: !tabLayout &&
                                                                  !largeLayout
                                                              ? height * 0.05
                                                              : height * 0.045,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2))
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              border: Border.all(
                                                                  width: 2,
                                                                  color: Colors
                                                                      .green)),
                                                          child: Center(
                                                            child: AutoSizeText(
                                                              'Change Profile Picture',
                                                              // textScaleFactor:
                                                              // textScaleFactor,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: tabLayout
                                                                      ? 20
                                                                      : largeLayout
                                                                          ? 14
                                                                          : 12),
                                                            ),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                fit: FlexFit.tight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => changeMobile(
                                                          context,
                                                          profileProvider),
                                                      child: Container(
                                                          width: width * 0.4,
                                                          height: !tabLayout &&
                                                                  !largeLayout
                                                              ? height * 0.05
                                                              : height * 0.045,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2))
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              border: Border.all(
                                                                  width: 2,
                                                                  color: Colors
                                                                      .green)),
                                                          child: Center(
                                                            child: Text(
                                                              'Change Mobile Number',
                                                              // textScaleFactor:
                                                              // textScaleFactor,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: tabLayout
                                                                      ? 18
                                                                      : largeLayout
                                                                          ? 12
                                                                          : 9),
                                                            ),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                        width: width * 0.02),
                                                    InkWell(
                                                      onTap: () => Navigator.of(
                                                              context)
                                                          .pushNamed(
                                                              '/address-list'),
                                                      child: Container(
                                                          width: width * 0.4,
                                                          height: !tabLayout &&
                                                                  !largeLayout
                                                              ? height * 0.05
                                                              : height * 0.045,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2))
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              border: Border.all(
                                                                  width: 2,
                                                                  color: Colors
                                                                      .green)),
                                                          child: Center(
                                                            child: Text(
                                                              'Add/Change Address',
                                                              // textScaleFactor:
                                                              // textScaleFactor,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: tabLayout
                                                                      ? 18
                                                                      : largeLayout
                                                                          ? 12
                                                                          : 10),
                                                            ),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: !tabLayout && !largeLayout
                                  ? height * 0.01
                                  : height > 800
                                      ? height * 0.04
                                      : height * 0.01,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: image != null
                                        ? CircleAvatar(
                                            radius: tabLayout ? 80 : 70,
                                            backgroundImage: FileImage(image!),
                                            // child: ClipRRect(
                                            //   borderRadius: tabLayout
                                            //       ? BorderRadius
                                            //           .circular(80)
                                            //       : BorderRadius
                                            //           .circular(70),
                                            //   child: Image.file(image!,
                                            //       fit: BoxFit.fill),
                                            // )
                                          )
                                        : image == null &&
                                                profileProvider['data']
                                                        ['profile_pic'] ==
                                                    null
                                            ? CircleAvatar(
                                                radius: tabLayout ? 80 : 70,
                                                backgroundColor: Colors.amber,
                                                // child: Image.asset(
                                                //   'assets/images/rkwxkca7.png',
                                                // ),
                                              )
                                            : CircleAvatar(
                                                radius: tabLayout
                                                    ? 80
                                                    : largeLayout
                                                        ? 70
                                                        : 50,
                                                backgroundImage: NetworkImage(
                                                    'http://34.100.212.22${profileProvider['data']['profile_pic']}'),
                                                // child: ClipRRect(
                                                //   borderRadius: tabLayout
                                                //       ? BorderRadius.circular(80)
                                                //       : BorderRadius.circular(70),
                                                //   child: Image.network(
                                                //       'http://34.100.212.22${profileProvider['data']['profile_pic']}'),
                                                // ),
                                              ),
                                  ),
                                  // SizedBox(height: height * 0.005),
                                  // Text(
                                  //   'Edit',
                                  //   // // textScaleFactor: textScaleFactor,
                                  //   style: TextStyle(
                                  //       color: Colors.grey[600],
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: tabLayout ? 20 : 14),
                                  // )
                                ],
                              ),
                            ),
                            // Positioned(
                            //   top: !tabLayout && !largeLayout
                            //       ? height * 0.14
                            //       : height > 800
                            //           ? height * 0.17
                            //           : height * 0.16,
                            //   left: !tabLayout && !largeLayout
                            //       ? width * 0.5
                            //       : width * 0.54,
                            //   child: InkWell(
                            //     onTap: () async {
                            //       pickImage(ImageSource.gallery).then((_) {
                            //         Provider.of<ProfileProvider>(context,
                            //                 listen: false)
                            //             .postProfileUpdate(
                            //                 image,
                            //                 profileProvider['data']['email'],
                            //                 profileProvider['data']['mobile']);
                            //       });
                            //     },
                            //     child: Icon(Icons.camera,
                            //         color: Colors.green,
                            //         size: tabLayout ? 34 : 30),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Text(
                              'Address',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 25
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                          ),
                          SizedBox(width: width * 0.2),
                          Expanded(
                            child: Text(
                              // widget.defaultAddress.isEmpty
                              //     ? 'No Address Selected'
                              //     : widget.defaultAddress,
                              // '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal, India',
                              defaultAddressProvider.isEmpty
                                  ? 'No Address Selected'
                                  : defaultAddressProvider,
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: tabLayout
                                      ? 25
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(right: width * 0.04),
                          //   child: InkWell(
                          //       onTap: () => Navigator.of(context)
                          //           .pushNamed('/address-list'),
                          //       child: const Icon(Icons.edit,
                          //           color: Colors.green)),
                          // )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Text(
                              'Mobile Number',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 25
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                          ),
                          SizedBox(width: width * 0.044),
                          Text(
                            '${profileProvider['data']['mobile']}',
                            // // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: tabLayout
                                    ? 25
                                    : largeLayout
                                        ? 14
                                        : 12),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.04),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Text(
                              'Email',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 25
                                      : largeLayout
                                          ? 14
                                          : 12),
                            ),
                          ),
                          SizedBox(width: width * 0.044),
                          Text(
                            '${profileProvider['data']['email']}',
                            // // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: tabLayout
                                    ? 25
                                    : largeLayout
                                        ? 14
                                        : 12),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
    );
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {'refresh': localStorage.getString('refresh')};
    var response = await Provider.of<Network>(context, listen: false)
        .logOut(data, 'api/logout/');
    print(response.body);
    localStorage.remove('token');

    // Navigator.of(context).pushNamed('/sign-in').then((_) {
    //   localStorage.remove('refresh');
    // });
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/onboarding-screens', (route) => false);
  }

  Future<void> changeEmail(
      BuildContext context, dynamic profileProvider) async {
    String? valueText;
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Change Email Address'),
              content: TextField(
                controller: TextEditingController(
                    text: profileProvider['data']['email']),
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      final response = await Provider.of<ProfileProvider>(
                              context,
                              listen: false)
                          .updateEmail(valueText!);
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(
                      //       content: ));
                      // var res = json.decode(response.body);

                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: const Text('Email Updated',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          action: SnackBarAction(
                              label: 'CLOSE',
                              textColor: Colors.white,
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar()),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(response['message'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          action: SnackBarAction(
                              label: 'CLOSE',
                              textColor: Colors.white,
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar()),
                        ));
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.green),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ));
  }

  Future<void> changeMobile(
      BuildContext context, dynamic profileProvider) async {
    String? valueText;
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Change Mobile Number'),
              content: TextField(
                controller: TextEditingController(
                    text: profileProvider['data']['mobile']),
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      final response = await Provider.of<ProfileProvider>(
                              context,
                              listen: false)
                          .updateNumber(valueText!);
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(
                      //       content: ));
                      // var res = json.decode(response.body);

                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: const Text('Mobile Number Updated',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          action: SnackBarAction(
                              label: 'CLOSE',
                              textColor: Colors.white,
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar()),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(response['message'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          action: SnackBarAction(
                              label: 'CLOSE',
                              textColor: Colors.white,
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar()),
                        ));
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.green),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ));
  }
}

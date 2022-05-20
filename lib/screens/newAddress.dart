import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/location/location.dart';

class NewAddress extends StatefulWidget {
  final String? name;
  final String? mobileNumber;
  final String? address;
  NewAddressState createState() => NewAddressState();

  NewAddress(this.name, this.mobileNumber, this.address);
}

class NewAddressState extends State<NewAddress> {
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  String? firstName;
  String? phoneNumber;
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<LocationProvider>(context).newAddressSet;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: !tabLayout && !largeLayout ? 80 : 100,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed('/new-address-select'),
            child: Container(
              width: width * 0.8,
              height:
                  !tabLayout && !largeLayout ? height * 0.075 : height * 0.055,
              margin: EdgeInsets.only(
                top: height * 0.02,
              ),
              padding: EdgeInsets.only(left: width * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.greenAccent,
                        // spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: !tabLayout && !largeLayout ? 22 : 30,
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    'Enter Address Here',
                    // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: tabLayout
                            ? width * 0.03
                            : largeLayout
                                ? 25
                                : 18),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: Container(
                  // margin: EdgeInsets.only(bottom: height * 0.04),
                  margin: EdgeInsets.only(top: height * 0.02),
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.0045),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            // color: Color.fromRGBO(227, 189, 255, 0.5),
                            offset: Offset(1, 2))
                      ]),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: tabLayout
                            ? width * 0.04
                            : largeLayout
                                ? 18
                                : 16),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Enter Name',
                        // suffixIcon:
                        //     Icon(Icons.check_circle, color: Colors.green),
                        // label: Text(
                        //   'Enter Your Phone Number',
                        // textScaleFactor: textScaleFactor,
                        //   style: const TextStyle(color: Colors.grey),
                        // ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_focusFirst),
                    validator: (fName) {
                      if (fName!.isEmpty) {
                        return 'Please Enter Name';
                      } else {
                        firstName = fName;
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: Container(
                  // margin: EdgeInsets.only(bottom: height * 0.04),
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.0045),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            // color: Color.fromRGBO(227, 189, 255, 0.5),
                            offset: Offset(1, 2))
                      ]),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: tabLayout
                            ? width * 0.04
                            : largeLayout
                                ? 18
                                : 16),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Enter Mobile Number',
                        // suffixIcon:
                        //     Icon(Icons.check_circle, color: Colors.green),
                        // label: Text(
                        //   'Enter Your Phone Number',
                        // textScaleFactor: textScaleFactor,
                        //   style: const TextStyle(color: Colors.grey),
                        // ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_focusFirst),
                    validator: (number) {
                      if (number!.isEmpty) {
                        return 'Please Enter Mobile Number';
                      } else {
                        phoneNumber = '+91' + number;
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(1, 2))
                      ]),
                  child:
                      Text(provider.isEmpty ? 'No Address Selected' : provider),
                ),
              ),
              SizedBox(height: height * 0.04),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.08, right: width * 0.08),
                child: InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      Provider.of<LocationProvider>(context, listen: false)
                          .setAddress(firstName!, phoneNumber!)
                          .then((_) =>
                              Navigator.of(context).pushNamed('/address-list'));
                    }
                    // else {
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: const Text(
                    //       'Please Enter Your OTP',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     backgroundColor: Colors.white,
                    //     action: SnackBarAction(
                    //         label: 'Ok',
                    //         onPressed: () => Navigator.of(context).pop()),
                    //   ));
                    // }
                  },
                  child: Container(
                    width: double.infinity,
                    height: height * 0.07,
                    margin: EdgeInsets.only(top: height * 0.02),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(57, 226, 14, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Save',
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? width * 0.04 : 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

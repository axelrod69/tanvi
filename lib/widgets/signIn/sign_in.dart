import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../authentication/network.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _numberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _otpKey = GlobalKey<FormState>();
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  // final _focusFifth = FocusNode();
  String? mobileNumber = '';
  String? firstOtp;
  String? secondOtp;
  String? thirdOtp;
  String? fourthOtp;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
    // _focusFifth.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _numberKey,
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.08, right: width * 0.08),
                child: Container(
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.0045),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 10,
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
                    decoration: InputDecoration(
                        hintText: 'Enter Your Phone Number',
                        hintStyle: tabLayout
                            ? TextStyle(fontSize: width * 0.04)
                            : TextStyle(fontSize: width * 0.05),
                        suffixIcon: mobileNumber!.length < 10
                            ? null
                            : const Icon(Icons.check_circle,
                                color: Colors.green),
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
                        return 'Please Enter Phone Number';
                      } else if (number.length < 10) {
                        return 'Incorrect Phone Number';
                      } else {
                        mobileNumber = '+91' + number;
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: width * 0.08),
                  child: InkWell(
                    onTap: () {
                      if (_numberKey.currentState!.validate()) {
                        validateNumber(mobileNumber!, context);
                      }
                    },
                    child: Text('Request OTP',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? width * 0.02 : 14)),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.only(left: width * 0.12),
              child: Text(
                'OTP',
                // // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: tabLayout ? width * 0.04 : 18),
              ),
            ),
            SizedBox(height: height * 0.02),
            Form(
              key: _otpKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tabLayout
                      ? Container(
                          // width: width * 0.15,
                          // height: height * 0.1,
                          width: width * 0.12,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(1, 2))
                              ]),
                          child: TextFormField(
                            showCursor: true,
                            cursorHeight: height * 0.07,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: width * 0.1),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_focusFirst),
                            validator: (first) {
                              firstOtp = first;
                              return null;
                            },
                          ),
                        )
                      : largeLayout
                          ? Container(
                              width: width * 0.15,
                              height: height * 0.075,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: 45,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 45),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                                validator: (first) {
                                  firstOtp = first;
                                  return null;
                                },
                              ),
                            )
                          : Container(
                              width: width * 0.15,
                              height: height * 0.092,
                              // padding: EdgeInsets.only(top: height * 0.04),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: height * 0.09,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 40),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                                validator: (first) {
                                  firstOtp = first;
                                  return null;
                                },
                              ),
                            ),
                  SizedBox(width: width * 0.04),
                  tabLayout
                      ? Container(
                          width: width * 0.12,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(1, 2))
                              ]),
                          child: TextFormField(
                            showCursor: true,
                            cursorHeight: height * 0.07,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: width * 0.1),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_focusSecond),
                            validator: (second) {
                              secondOtp = second;
                              return null;
                            },
                          ),
                        )
                      : largeLayout
                          ? Container(
                              width: width * 0.15,
                              height: height * 0.075,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: 45,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 45),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusSecond),
                                validator: (second) {
                                  secondOtp = second;
                                  return null;
                                },
                              ),
                            )
                          : Container(
                              width: width * 0.15,
                              height: height * 0.092,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: height * 0.09,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 40),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusSecond),
                                validator: (second) {
                                  secondOtp = second;
                                  return null;
                                },
                              ),
                            ),
                  SizedBox(width: width * 0.04),
                  tabLayout
                      ? Container(
                          width: width * 0.12,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(1, 2))
                              ]),
                          child: TextFormField(
                            showCursor: true,
                            cursorHeight: height * 0.07,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: width * 0.1),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_focusThird),
                            validator: (third) {
                              thirdOtp = third;
                              return null;
                            },
                          ),
                        )
                      : largeLayout
                          ? Container(
                              width: width * 0.15,
                              height: height * 0.075,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: 45,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 45),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusThird),
                                validator: (third) {
                                  thirdOtp = third;
                                  return null;
                                },
                              ),
                            )
                          : Container(
                              width: width * 0.15,
                              height: height * 0.092,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: height * 0.09,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 40),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusThird),
                                validator: (third) {
                                  thirdOtp = third;
                                  return null;
                                },
                              ),
                            ),
                  SizedBox(width: width * 0.04),
                  tabLayout
                      ? Container(
                          width: width * 0.12,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(1, 2))
                              ]),
                          child: TextFormField(
                            showCursor: true,
                            cursorHeight: height * 0.07,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: width * 0.1),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_focusFourth),
                            validator: (fourth) {
                              fourthOtp = fourth;
                              return null;
                            },
                          ),
                        )
                      : largeLayout
                          ? Container(
                              width: width * 0.15,
                              height: height * 0.075,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: 45,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 45),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFourth),
                                validator: (fourth) {
                                  fourthOtp = fourth;
                                  return null;
                                },
                              ),
                            )
                          : Container(
                              width: width * 0.15,
                              height: height * 0.092,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(1, 2))
                                  ]),
                              child: TextFormField(
                                showCursor: true,
                                cursorHeight: height * 0.09,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 40),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFourth),
                                validator: (fourth) {
                                  fourthOtp = fourth;
                                  return null;
                                },
                              ),
                            ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: height * 0.06),
        Text(
          'Forgot your password?',
          textAlign: TextAlign.center,
          // // textScaleFactor: textScaleFactor,
          style: TextStyle(
              color: Colors.grey, fontSize: tabLayout ? width * 0.03 : 14),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
          child: InkWell(
            onTap: () {
              if (_otpKey.currentState!.validate()) {
                login(firstOtp!, secondOtp!, thirdOtp!, fourthOtp!,
                    mobileNumber!, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Please Enter Your OTP',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  action: SnackBarAction(
                      label: 'Ok',
                      onPressed: () => Navigator.of(context).pop()),
                ));
              }
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
                  'Login',
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
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont\'t have an account?',
              textAlign: TextAlign.center,
              // // textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: Colors.grey, fontSize: tabLayout ? width * 0.025 : 14),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/sign-up'),
              child: Text(
                'Sign Up',
                textAlign: TextAlign.center,
                // // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout ? width * 0.025 : 14),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: facebookLogin,
              child: Container(
                width: tabLayout ? width * 0.12 : width * 0.18,
                height: tabLayout
                    ? height * 0.065
                    : largeLayout
                        ? height * 0.065
                        : height * 0.075,
                padding:
                    EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                  child: Image.asset(
                      'assets/images/facebook-logo-transparent.png'),
                ),
              ),
            ),
            SizedBox(width: width * 0.04),
            InkWell(
              onTap: googleLogin,
              child: Container(
                width: tabLayout ? width * 0.12 : width * 0.18,
                height: tabLayout
                    ? height * 0.065
                    : largeLayout
                        ? height * 0.065
                        : height * 0.075,
                padding:
                    EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                  child: Image.asset('assets/images/google-logo.png'),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  void validateNumber(String number, BuildContext context) async {
    var data = {'mobile': number.toString()};
    var response = await Provider.of<Network>(context, listen: false)
        .logIn(data, 'api/login/');
    print(response.body);
    var responseCode = json.decode(response.body);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('OTP Sent To Your Email',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.green,
      action: SnackBarAction(
          label: 'Close',
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
    ));
  }

  void login(String firstOtp, String secondOtp, String thirdOtp,
      String fourthOtp, String mobileNumber, BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String otp = firstOtp + secondOtp + thirdOtp + fourthOtp;
    var data = {'otp': otp, 'mobile': mobileNumber};

    var response = await Provider.of<Network>(context, listen: false)
        .loginOtp(data, 'api/login-otp/');
    print(response.body);
    var receivedResponse = json.decode(response.body);

    if (receivedResponse['message'] == 'User login Successfully.') {
      await localStorage.setString('token', receivedResponse['access']);
      await localStorage.setString('refresh', receivedResponse['refresh']);

      Navigator.of(context).pushNamed('/landing-page');
    } else if (receivedResponse['context']['message'] ==
        'You Enter Wrong OTP') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Incorrect OTP',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'Close',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Please Enter OTP',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'Close',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }

  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }

  googleLogin() async {
    print("googleLogin method Called");
    final _googleSignIn = GoogleSignIn();
    var result = await _googleSignIn.signIn();
    print("Result $result");
  }
}

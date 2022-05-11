import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../../authentication/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottomNavigation.dart';

class InputOTP extends StatefulWidget {
  InputOTPState createState() => InputOTPState();
  // final String email;

  // InputOTP(this.email);
}

class InputOTPState extends State<InputOTP> {
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  final _key = GlobalKey<FormState>();
  String? _firstPin;
  String? _secondPin;
  String? _thirdPin;
  String? _fourthPin;

  @override
  void dispose() {
    // TODO: implement dispose
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // var textScale = MediaQuery.of(context).textScaleFactor;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mobile = routes['mobile'];

    print(mobile);

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
          key: _key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tabLayout
                  ? Container(
                      width: width * 0.15,
                      height: height * 0.1,
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
                        cursorHeight: height * 0.08,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: width * 0.1),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_focusFirst),
                        validator: (first) {
                          _firstPin = first;
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
                              _firstPin = first;
                              return null;
                            },
                          ),
                        )
                      : Container(
                          width: width * 0.15,
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
                            cursorHeight: height * 0.04,
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
                              _firstPin = first;
                              return null;
                            },
                          ),
                        ),
              SizedBox(width: width * 0.04),
              tabLayout
                  ? Container(
                      width: width * 0.15,
                      height: height * 0.1,
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
                        cursorHeight: height * 0.08,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: width * 0.1),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_focusSecond),
                        validator: (second) {
                          _secondPin = second;
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
                              _secondPin = second;
                              return null;
                            },
                          ),
                        )
                      : Container(
                          width: width * 0.15,
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
                            cursorHeight: height * 0.04,
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
                              _secondPin = second;
                              return null;
                            },
                          ),
                        ),
              SizedBox(width: width * 0.04),
              tabLayout
                  ? Container(
                      width: width * 0.15,
                      height: height * 0.1,
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
                        cursorHeight: height * 0.08,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: width * 0.1),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_focusThird),
                        validator: (third) {
                          _thirdPin = third;
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
                              _thirdPin = third;
                              return null;
                            },
                          ),
                        )
                      : Container(
                          width: width * 0.15,
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
                            cursorHeight: height * 0.04,
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
                              _thirdPin = third;
                              return null;
                            },
                          ),
                        ),
              SizedBox(width: width * 0.04),
              tabLayout
                  ? Container(
                      width: width * 0.15,
                      height: height * 0.1,
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
                        cursorHeight: height * 0.08,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: width * 0.1),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_focusFourth),
                        validator: (fourth) {
                          _fourthPin = fourth;
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
                              _fourthPin = fourth;
                              return null;
                            },
                          ),
                        )
                      : Container(
                          width: width * 0.15,
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
                            cursorHeight: height * 0.04,
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
                              _fourthPin = fourth;
                              return null;
                            },
                          ),
                        ),
            ],
          ),
        ),
        // Form(
        //   key: _key,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Center(
        //         child: Container(
        //           width: width * 0.16,
        //           height: height * 0.08,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.white,
        //               boxShadow: const [
        //                 BoxShadow(
        //                     color: Colors.grey,
        //                     blurRadius: 8,
        //                     offset: Offset(1, 2))
        //               ]),
        //           child: TextFormField(
        //             showCursor: true,
        //             cursorHeight: 45,
        //             inputFormatters: [LengthLimitingTextInputFormatter(1)],
        //             keyboardType: TextInputType.number,
        //             style: const TextStyle(fontSize: 45),
        //             textAlign: TextAlign.center,
        //             obscureText: true,
        //             obscuringCharacter: '*',
        //             decoration: const InputDecoration(
        //                 focusedBorder: InputBorder.none,
        //                 border: InputBorder.none),
        //             onFieldSubmitted: (_) =>
        //                 FocusScope.of(context).requestFocus(_focusSecond),
        //             validator: (first) {
        //               _firstPin = first.toString();
        //               return null;
        //             },
        //           ),
        //         ),
        //       ),
        //       Center(
        //         child: Container(
        //           width: width * 0.16,
        //           height: height * 0.08,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.white,
        //               boxShadow: const [
        //                 BoxShadow(
        //                     color: Colors.grey,
        //                     blurRadius: 8,
        //                     offset: Offset(1, 2))
        //               ]),
        //           child: TextFormField(
        //               showCursor: true,
        //               cursorHeight: 45,
        //               inputFormatters: [LengthLimitingTextInputFormatter(1)],
        //               keyboardType: TextInputType.number,
        //               // focusNode: _focusSecond,
        //               style: const TextStyle(fontSize: 45),
        //               textAlign: TextAlign.center,
        //               obscureText: true,
        //               obscuringCharacter: '*',
        //               decoration: const InputDecoration(
        //                   focusedBorder: InputBorder.none,
        //                   border: InputBorder.none),
        //               onFieldSubmitted: (_) =>
        //                   FocusScope.of(context).requestFocus(_focusThird),
        //               validator: (second) {
        //                 _secondPin = second.toString();
        //                 return null;
        //               }),
        //         ),
        //       ),
        //       Center(
        //         child: Container(
        //           width: width * 0.16,
        //           height: height * 0.08,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.white,
        //               boxShadow: const [
        //                 BoxShadow(
        //                     color: Colors.grey,
        //                     blurRadius: 8,
        //                     offset: Offset(1, 2))
        //               ]),
        //           child: TextFormField(
        //               showCursor: true,
        //               cursorHeight: 45,
        //               inputFormatters: [LengthLimitingTextInputFormatter(1)],
        //               // focusNode: _focusThird,
        //               keyboardType: TextInputType.number,
        //               style: const TextStyle(fontSize: 45),
        //               textAlign: TextAlign.center,
        //               obscureText: true,
        //               obscuringCharacter: '*',
        //               decoration: const InputDecoration(
        //                   focusedBorder: InputBorder.none,
        //                   border: InputBorder.none),
        //               onFieldSubmitted: (_) =>
        //                   FocusScope.of(context).requestFocus(_focusFourth),
        //               validator: (third) {
        //                 _thirdPin = third.toString();
        //                 return null;
        //               }),
        //         ),
        //       ),
        //       Center(
        //         child: Container(
        //           width: width * 0.16,
        //           height: height * 0.08,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.white,
        //               boxShadow: const [
        //                 BoxShadow(
        //                     color: Colors.grey,
        //                     blurRadius: 8,
        //                     offset: Offset(1, 2))
        //               ]),
        //           child: TextFormField(
        //               showCursor: true,
        //               cursorHeight: 45,
        //               inputFormatters: [LengthLimitingTextInputFormatter(1)],
        //               // focusNode: _focusFourth,
        //               keyboardType: TextInputType.number,
        //               style: const TextStyle(fontSize: 45),
        //               textAlign: TextAlign.center,
        //               obscureText: true,
        //               obscuringCharacter: '*',
        //               decoration: const InputDecoration(
        //                   focusedBorder: InputBorder.none,
        //                   border: InputBorder.none),
        //               validator: (fourth) {
        //                 _fourthPin = fourth.toString();
        //                 return null;
        //               }),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(height: height * 0.045),
        InkWell(
          onTap: () {
            if (_key.currentState!.validate()) {
              checkOtp(mobile, context);
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
                'Validate',
                // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout
                        ? width * 0.03
                        : largeLayout
                            ? 18
                            : 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void checkOtp(String mobile, BuildContext context) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    var otp = _firstPin! + _secondPin! + _thirdPin! + _fourthPin!;
    var data = {'otp': otp, 'mobile': mobile};
    print(data);
    var response = await Provider.of<Network>(context, listen: false)
        .checkOtp(data, 'api/validateotp/');
    print(response.body);
    var receivedResponse = json.decode(response.body);

    print('Access Token ${receivedResponse['access']}');

    if (receivedResponse['detail'] ==
        'Otp has been matched successfully. Please Validate your Account') {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      // SharedPreferences refreshStorage = await SharedPreferences.getInstance();
      await localStorage.setString('token', receivedResponse['access']);
      await localStorage.setString('refresh', receivedResponse['refresh']);
      Navigator.of(context).pushNamed('/landing-page');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Incorrect OTP',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }
}

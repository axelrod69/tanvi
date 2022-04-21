import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../../authentication/network.dart';

class InputOTP extends StatefulWidget {
  InputOTPState createState() => InputOTPState();
  // final String email;

  // InputOTP(this.email);
}

class InputOTPState extends State<InputOTP> {
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  final _key = GlobalKey<FormState>();
  var _firstPin = '';
  var _secondPin = '';
  var _thirdPin = '';
  var _fourthPin = '';
  var _fifthPin = '';

  @override
  void dispose() {
    // TODO: implement dispose
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScale = MediaQuery.of(context).textScaleFactor;

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
          key: _key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  width: width * 0.16,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    showCursor: true,
                    cursorHeight: 45,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 45),
                    textAlign: TextAlign.center,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_focusSecond),
                    validator: (first) {
                      _firstPin = first.toString();
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.16,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      keyboardType: TextInputType.number,
                      // focusNode: _focusSecond,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_focusThird),
                      validator: (second) {
                        _secondPin = second.toString();
                        return null;
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.16,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      // focusNode: _focusThird,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_focusFourth),
                      validator: (third) {
                        _thirdPin = third.toString();
                        return null;
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.16,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      // focusNode: _focusFourth,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      validator: (fourth) {
                        _fourthPin = fourth.toString();
                        return null;
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.16,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                      showCursor: true,
                      cursorHeight: 45,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      // focusNode: _focusFourth,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 45),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                      validator: (fifth) {
                        _fifthPin = fifth.toString();
                        return null;
                      }),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.045),
        InkWell(
          onTap: () {
            if (_key.currentState!.validate()) {
              checkOtp();
            }
          },
          child: Container(
            width: double.infinity,
            height: height * 0.07,
            margin: EdgeInsets.only(top: height * 0.02),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(57, 226, 14, 1),
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Text(
                'Sign Up',
                // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void checkOtp() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    String otp = _firstPin + _secondPin + _thirdPin + _fourthPin + _fifthPin;
    print(otp);
    var response = await Provider.of<Network>(context, listen: false)
        .checkOtp(otp, 'api/validateotp/');
    print(response.body);
  }
}

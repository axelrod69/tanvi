import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      body: Container(
          height: height * 1,
          width: double.infinity,
          // margin: EdgeInsets.only(top: height * 0.08),
          padding: EdgeInsets.only(top: height * 0.08),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 392.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/sign_up_asset.png',
                      fit: BoxFit.cover),
                ],
              ),
              Positioned(
                child: Form(
                  key: _globalKey,
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          'Sign Up',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              margin: EdgeInsets.only(bottom: height * 0.04),
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
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
                                style: const TextStyle(fontSize: 18),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Name',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    //   textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
                              margin: EdgeInsets.only(bottom: height * 0.04),
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
                                style: const TextStyle(fontSize: 18),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Phone Number',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    //   textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.0045),
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
                                style: const TextStyle(fontSize: 18),
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your Address',
                                    // suffixIcon:
                                    //     Icon(Icons.check_circle, color: Colors.green),
                                    // label: Text(
                                    //   'Enter Your Phone Number',
                                    //   textScaleFactor: textScaleFactor,
                                    //   style: const TextStyle(color: Colors.grey),
                                    // ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_focusFirst),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.08, right: width * 0.08),
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/home-screen'),
                          child: Container(
                            width: double.infinity,
                            height: height * 0.07,
                            margin: EdgeInsets.only(top: height * 0.02),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(57, 226, 14, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            textAlign: TextAlign.center,
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed('/sign-in'),
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

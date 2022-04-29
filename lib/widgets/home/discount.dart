import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/coupon/couponProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Discount extends StatefulWidget {
  DiscountState createState() => DiscountState();
}

class DiscountState extends State<Discount> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CouponProvider>(context, listen: false)
        .fetchCoupons()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<CouponProvider>(context).coupon;

    // TODO: implement build
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
            child: Container(
                width: width * 0.95,
                height: height * 0.22,
                padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.01,
                  right: width * 0.02,
                  // bottom: height * 0.01
                ),
                // color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      InkWell(
                        onTap: () => showAlertDialog(
                            context,
                            provider['data'][index]['offer_full_desc'],
                            provider['data'][index]['offer_code']),
                        child: Container(
                          width: width * 0.75,
                          height: height * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent[100],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'http://3.109.206.91:8000${provider['data'][index]['offer_banner']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.25,
                        // right: 0,
                        top: height * 0.08,
                        child: InkWell(
                          onTap: () => showAlertDialog(
                              context,
                              provider['data'][index]['offer_full_desc'],
                              provider['data'][index]['offer_code']),
                          child: Text(
                            provider['data'][index]['offer_code'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.18,
                        // right: 0,
                        top: height * 0.11,
                        child: InkWell(
                          onTap: () => showAlertDialog(
                              context,
                              provider['data'][index]['offer_full_desc'],
                              provider['data'][index]['offer_code']),
                          child: Text(
                            'Discounts upto ${provider['data'][index]['discount']}%',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  itemCount: provider['data'].length,
                )),
          );
  }

  void showAlertDialog(BuildContext context, String description, String code) {
    print('Dialog Clicked');
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Offer Applicable'),
              content: Text(description, textAlign: TextAlign.center),
              actions: [
                TextButton(
                    onPressed: () async {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.setString('coupon', code).then((_) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('$code Selected'),
                          action: SnackBarAction(
                              label: 'OK',
                              onPressed: () => Navigator.of(context).pop()),
                        ));
                      });
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ));
  }
}

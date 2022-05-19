import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/order/orderProvider.dart';

class PaymentLoadingScreen extends StatefulWidget {
  final String receipt;
  final String responseOrderId;
  final String responsePaymentId;
  final String responseSignature;

  PaymentLoadingScreenState createState() => PaymentLoadingScreenState();

  PaymentLoadingScreen(this.receipt, this.responseOrderId,
      this.responsePaymentId, this.responseSignature);
}

class PaymentLoadingScreenState extends State<PaymentLoadingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderProvider>(context, listen: false)
        .razorPayVerification(widget.receipt, widget.responseOrderId,
            widget.responsePaymentId, widget.responseSignature)
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context).verification;

    // TODO: implement build
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Text(
            'Verifying Payment',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewAndRating extends StatefulWidget {
  ReviewAndRatingState createState() => ReviewAndRatingState();
}

class ReviewAndRatingState extends State<ReviewAndRating> {
  double rating = 0;
  final List<dynamic> _review = [
    {
      'name': 'Super Market',
      'description': 'Lorem Ipsum dolor sit amet',
      'totalRatings': 14,
      'image': 'assets/images/0lfc89xj.png'
    },
    {
      'name': 'Super Market',
      'description': 'Lorem Ipsum dolor sit amet',
      'totalRatings': 14,
      'image': 'assets/images/6fge7386.png'
    },
    {
      'name': 'Super Market',
      'description': 'Lorem Ipsum dolor sit amet',
      'totalRatings': 14,
      'image': 'assets/images/qk855erb.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.005, right: width * 0.02),
      decoration: BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review and Rating',
            // // textScaleFactor: textScaleFactor,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: tabLayout ? 25 : 18),
          ),
          SizedBox(height: height * 0.005),
          Expanded(
            child: Container(
              width: double.infinity,
              // color: Colors.amber,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: tabLayout ? height * 0.1 : height * 0.08,
                  margin: EdgeInsets.only(bottom: height * 0.01),
                  padding:
                      EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      Image.asset(
                        _review[index]['image'],
                        fit: BoxFit.cover,
                        scale: 0.6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _review[index]['name'],
                            // // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout ? 22 : 14),
                          ),
                          Text(
                            _review[index]['description'],
                            // // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout ? 20 : 14),
                          ),
                          SizedBox(height: height * 0.005),
                          Row(
                            children: [
                              RatingBar.builder(
                                allowHalfRating: true,
                                minRating: 1,
                                itemSize: tabLayout ? 18 : 12,
                                // itemPadding: EdgeInsets.symmetric(
                                //     horizontal: 0.05, vertical: 0.05),
                                itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.yellow),
                                onRatingUpdate: (double value) {
                                  setState(() {
                                    rating = value;
                                  });
                                },
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                '(${_review[index]['totalRatings'].toString()})',
                                // // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout ? 15 : 12),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                itemCount: _review.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/wishList/wishList.dart';

class WishListScreen extends StatefulWidget {
  WishListScreenState createState() => WishListScreenState();
}

class WishListScreenState extends State<WishListScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WishListProvider>(context, listen: false)
        .fetchProducts()
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
    final provider = Provider.of<WishListProvider>(context).wishList;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: width * 0.9,
        height: height * 0.31,
        margin: EdgeInsets.only(bottom: height * 0.04),
        decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04, top: height * 0.01, right: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Wishlist',
                    // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  // Text(
                  //   'View All',
                  //   // textScaleFactor: textScaleFactor,
                  //   style: TextStyle(
                  //       color: Colors.green, fontWeight: FontWeight.bold),
                  // )
                ],
              ),
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  )
                : Expanded(
                    child: Container(
                      width: double.infinity,
                      height: height * 0.1,
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.005,
                          width * 0.02, height * 0.008),
                      margin: EdgeInsets.only(top: height * 0.01),
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed('item-details-two', arguments: {
                            'id': provider['data'][index]['ProductId'],
                            'wishListId': provider['data'][index]['id'],
                            'name': provider['data'][index]['ProductName'],
                            'image': provider['data'][index]['mainImage'],
                            'description': provider['data'][index]
                                ['ShortDescription'],
                            'price': provider['data'][index]['price'],
                            'quantity': 0
                          }),
                          child: Container(
                            width: width * 0.45,
                            height: double.infinity,
                            margin: EdgeInsets.only(right: width * 0.02),
                            // color: Colors.amber,
                            child: Stack(
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        provider['data'][index]['mainImage'],
                                        fit: BoxFit.cover,
                                        width: width * 0.45,
                                        height: height * 0.2,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.03),
                                        child: Text(
                                          provider['data'][index]
                                              ['ProductName'],
                                          // textScaleFactor: textScaleFactor,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.03),
                                        child: Text(
                                            '₹${provider['data'][index]['price'].toString()}',
                                            // textScaleFactor: textScaleFactor,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                Positioned(
                                  left: width * 0.39,
                                  child: InkWell(
                                    onTap: () => deleteItem(
                                        provider['data'][index]['id']),
                                    child: const Icon(Icons.delete,
                                        color:
                                            Color.fromARGB(255, 153, 31, 23)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: provider['data'].length,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void deleteItem(int wishListId) async {
    final response = await Provider.of<WishListProvider>(context, listen: false)
        .deleteItem(wishListId);
  }
}

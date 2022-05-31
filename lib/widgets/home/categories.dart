import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/categories/categoryList.dart';
import '../../model/category/categoryProvider.dart';

class Categories extends StatefulWidget {
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  bool isLoading = true;

  // final List<dynamic> _categories = [
  //   {'id': 1, 'image': 'assets/images/Layer_3.png', 'name': 'Vegetables'},
  //   {'id': 2, 'image': 'assets/images/Layer_4.png', 'name': 'Fruits'},
  //   {'id': 3, 'image': 'assets/images/Layer_5.png', 'name': 'Meat'},
  //   {'id': 4, 'image': 'assets/images/Layer_6.png', 'name': 'Seafood'},
  //   {'id': 5, 'image': 'assets/images/Layer_7.png', 'name': 'Groceries'},
  //   {'id': 6, 'image': 'assets/images/Layer_3.png', 'name': 'Vegetables'},
  //   {'id': 7, 'image': 'assets/images/Layer_4.png', 'name': 'Fruits'},
  //   {'id': 8, 'image': 'assets/images/Layer_5.png', 'name': 'Meat'},
  //   {'id': 9, 'image': 'assets/images/Layer_6.png', 'name': 'Seafood'},
  //   {'id': 10, 'image': 'assets/images/Layer_7.png', 'name': 'Groceries'}
  // ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoryProvider>(context, listen: false)
        .getCategory()
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
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider =
        Provider.of<CategoryProvider>(context, listen: false).category;

    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: width * 0.9,
        height: !tabLayout && !largeLayout ? height * 0.28 : height * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
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
                children: [
                  Text(
                    'Categories',
                    // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 25
                            : largeLayout
                                ? 17
                                : 12),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/category-screen'),
                    child: Text(
                      'View All',
                      // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: tabLayout
                              ? 18
                              : largeLayout
                                  ? 14
                                  : 10),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: height * 0.1,
                      margin: EdgeInsets.only(top: height * 0.01),
                      padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.005,
                          right: width * 0.02,
                          bottom: height * 0.008),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          width: width * 0.3,
                          height: height * 0.06,
                          // padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.01,
                          //     width * 0.02, height * 0.01),
                          margin: EdgeInsets.only(right: width * 0.02),
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.004),
                                child: InkWell(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => CategoryList(
                                        provider[index]['id'],
                                        provider[index]['name']),
                                  )),
                                  child: Container(
                                    width: double.infinity,
                                    height: tabLayout
                                        ? height * 0.14
                                        : largeLayout
                                            ? height * 0.12
                                            : height * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(
                                        provider[index]['categoryImage']),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                provider[index]['name'],
                                textAlign: TextAlign.center,
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? width * 0.02
                                        : largeLayout
                                            ? 14
                                            : 12),
                              )
                            ],
                          ),
                        ),
                        itemCount: provider.length,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

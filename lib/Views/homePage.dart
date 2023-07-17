import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_adv_flutter/Model/Helper_Class/helper.dart';

import '../Model/Model.dart';
import '../Provider/Provider.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  String textfieldSearch = "cricket";
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("AAJ-TAK"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade500,
      ),
      body: (Provider.of<ConnectionProvider>(context)
                  .connectivityModel
                  .connectivityStatus ==
              "Waiting")
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Waiting"),
                  // Image.asset(
                  //   'assets/images/download.png',
                  //   height: 200,
                  //   width: 200,
                  // ),
                  // SizedBox(
                  //   height: h * 0.01,
                  // ),
                  // Text(
                  //   "No Internet Connection",
                  //   style: TextStyle(fontSize: h * 0.022),
                  // ),
                ],
              ),
            )
          : FutureBuilder(
              future: APIHelper.apiHelper.callApi(Search: textfieldSearch),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.error}"),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  List<Product>? data = snapshot.data;
                  return Column(
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      TextField(
                        // controller: Provider.of<WeatherProvider>(context)
                        //     .searchLocation
                        //     .locationController,
                        style: TextStyle(
                          color: Provider.of<ThemeProvider>(context).isdark
                              ? Colors.black87
                              : Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .isdark
                                  ? Colors.black.withOpacity(0.4)
                                  : const Color(0xFF073947).withOpacity(0.8),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .isdark
                                  ? Colors.black.withOpacity(0.4)
                                  : const Color(0xFF073947).withOpacity(0.8),
                            ),
                          ),
                          fillColor: Colors.transparent,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.search_sharp,
                            color: Provider.of<ThemeProvider>(context).isdark
                                ? Colors.black87
                                : Colors.white,
                          ),
                          hintText: "Search News ",
                          hintStyle: TextStyle(
                            color: Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .isdark
                                ? Colors.black87
                                : Colors.white,
                          ),
                        ),
                        // onSubmitted: (val) {
                        //   Provider.of<ThemeProvider>(context, listen: false)
                        //       .SearchText(val);
                        // },
                        onChanged: (val) {
                          // Provider.of<ThemeProvider>(context, listen: false)
                          //     .SearchText(val);
                          textfieldSearch = val;
                        },
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        "HeadLines",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                //  height: h,
                                width: w,
                                padding: EdgeInsets.all(16),
                                color: Colors.grey.shade500,
                                child: Column(
                                  children: [
                                    Text(
                                      data[i].title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: h * 0.02,
                                    ),
                                    Text(
                                      "Tap For More",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: data!.length,
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: SizedBox(
                    height: h,
                    width: w,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

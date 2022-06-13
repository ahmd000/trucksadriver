import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:trucksadriver/Widget/bodys.dart';

import '../../GetX/GetXData.dart';
import '../../halp/Color.dart';
import '../../halp/TextStyle.dart';
import '../../halp/lan.dart';
import '../../main.dart';
import '../Data.dart';
import 'products.dart';

class sections extends StatefulWidget {
  Map<String, dynamic> data;

  sections(this.data);

  @override
  _sectionsState createState() => _sectionsState();
}

class _sectionsState extends State<sections> {
  var GetXCAtegories = Get.put<GetXData>(GetXData());

  // var gexXUser = Get.put<GexXUser>(GexXUser());

  late double height;

  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
        textDirection: settings.lanDirection,
        child: GetBuilder<GetXData>(
            init: GetXCAtegories,
            builder: (_) {
              return Bodys(
                child: Scaffold(

                  // drawer: Drawer(),
                  body: Container(
                    height: height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 1.5,
                              height: height / 20,
                              child: PhysicalModel(
                                  color: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(lan["Helpusfindoutwhatyouoffer"]!,
                                        textAlign: TextAlign.center, style: Text1),
                                  )),
                            ),
                          ),
                          Container(
                            height: height / 1.18,
                            width: width,
                            child: RefreshIndicator(
                              onRefresh: () => GetXCAtegories.getdata(),
                              child: StaggeredGridView.countBuilder(
                                  staggeredTileBuilder: (index) =>
                                      StaggeredTile.count(1, 0.7),
                                  crossAxisCount: 2,
                                  itemCount: GetXCAtegories.data.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8,
                                        top: 8,
                                        right: width / 15,
                                        left: width / 15,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => products(
                                                      index, widget.data)));
                                        },
                                        child: Container(
                                          width: width / 3,
                                          height: height / 6.2,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                )
                                              ]),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height / 8.3,
                                                width: width / 3,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      image: NetworkImage(
                                                          GetXCAtegories
                                                              .data
                                                              .data[index]
                                                              .sectionimage
                                                              .imagePage)),
                                                ),
                                              ),
                                              Center(
                                                  child: Text(GetXCAtegories
                                                      .data.data[index].name))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../model/Futu.dart';
import '../model/Orde.dart';
import '../model/Paragraphs.dart';
import '../model/Section.dart';

class GetXData extends GetxController {
  Section data = Section.fromJson({});
  Paragraphs datap = Paragraphs.fromJson({});
  List<Orde> orderreqwati = [];
  List<Orde> orderral = [];
  bool type = true;
  int inde = 0;

  setindex(int index) {
    inde = index;
    update();
  }

  Future<void> getdata() async {
    datap = await fuataCategories.getdata();
    update();
    data = await fuataCategories.allSection();
    update();

    // print(data.data.length);
  }

  getorder(int id) async {
    orderral = await FutuOrder.getorders(id);
    // print(orderral);
    update();
  }

  getorderorderral(List<Orde> data) async {
    orderreqwati = data;
    update();
  }
}

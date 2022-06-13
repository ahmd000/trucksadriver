import 'package:flutter/material.dart';

import '../main.dart';

class Bodys extends Scaffold {
  Widget child;
  bool back;

  Bodys({required this.child, this.back = true});

  @override
  // TODO: implement body
  Widget? get body => SafeArea(
      child: Directionality(
          textDirection: settings.lanDirection,
          child: Stack(
            children: [
              child,
              if (back)
                Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black38),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    );
                  }
                ),
            ],
          )));
}

import 'package:flutter/material.dart';
import 'BusinessCardForm.dart';
import "BusinessCardModel.dart";
import "BusinessCard.dart";
import 'dart:async';
import 'package:scroll_snap_list/scroll_snap_list.dart';
// import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart'
;
class BusinessCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BusinessCardPageState();
  }
}

class BusinessCardPageState extends State<BusinessCardPage> {
  int _focusIndex = 0;
  BusinessCardModel currBusinessCardModel;
  StreamController<BusinessCardModel> streamController;
  Stream<BusinessCardModel> broadcastStream;
  List<BusinessCard> businessCardList;
  List<GlobalKey> globalKeyList;

  @override
  initState() {
    super.initState();
    streamController = StreamController<BusinessCardModel>();
    broadcastStream = streamController.stream.asBroadcastStream();
    currBusinessCardModel = BusinessCardModel("", "", "" ,"", "", "", "", "", "", "");
    globalKeyList = List(8);
    for(int i = 0; i<8; i++) {
      globalKeyList[i] = GlobalKey();
    }

    businessCardList = [
      BusinessCard(key: globalKeyList[0], childKey: globalKeyList[1], backgroundColor: Colors.blue, textColor: Colors.white, businessCardModel: currBusinessCardModel, stream: broadcastStream),
      BusinessCard(key: globalKeyList[2], childKey: globalKeyList[3], backgroundColor: Colors.black, textColor: Colors.white, businessCardModel: currBusinessCardModel, stream: broadcastStream),
      BusinessCard(key: globalKeyList[4], childKey: globalKeyList[5], backgroundColor: Colors.red, textColor: Colors.white, businessCardModel: currBusinessCardModel, stream: broadcastStream),
      BusinessCard(key: globalKeyList[6], childKey: globalKeyList[7], backgroundColor: Colors.lightGreen, textColor: Colors.black, businessCardModel: currBusinessCardModel, stream: broadcastStream),
    ];
  }

  @override 
  dispose() {
    streamController.close();
    super.dispose();
  }

  _onItemFocus(int index) {
    setState(() {
      _focusIndex = index;
    });
  }

  Future<void> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKeyList[_focusIndex*2 + 1].currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      // var bs64 = base64Encode(pngBytes);
      setState(() {});
      await Share.file('ShoopyDemo', 'ShoopyDemo.png', pngBytes, 'image/png', text: 'Shoopy Demo Text');
      return;
    } catch (e) {
      print(e);
    }
    return;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/3.25,
            child: ScrollSnapList(
              onItemFocus: _onItemFocus,
              scrollDirection: Axis.horizontal,
              itemSize: MediaQuery.of(context).size.width - 25,
              itemCount: businessCardList.length,
              itemBuilder: (context, index) {
                return businessCardList[index];
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BusinessCardForm(
                    onBusinessCardModelChange: (BusinessCardModel businessCardModel) {
                      streamController.add(businessCardModel);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    child: FlatButton.icon(
                      icon: Icon(Icons.share, color: Colors.white),
                      color: Color(0xff20208A), 
                      label: Text("Share", textScaleFactor: 1.5, style: TextStyle(color: Colors.white)),
                      onPressed: _capturePng,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],          
      )
    );
  }
}
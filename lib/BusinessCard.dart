import 'package:flutter/material.dart';
import 'BusinessCardModel.dart';
import 'dart:async';

class BusinessCard extends StatefulWidget {
  BusinessCard({
    @required this.key,
    @required this.childKey,  
    @required this.backgroundColor, 
    @required this.textColor, 
    @required this.businessCardModel, 
    @required this.stream});
    
  final key;
  final childKey;
  final Color backgroundColor;
  final Color textColor;
  final BusinessCardModel businessCardModel;
  final Stream stream;
  State<StatefulWidget> createState() {
    return _BusinessCardState();
  }    
}

class _BusinessCardState extends State<BusinessCard> {
  BusinessCardModel businessCardModel;
  Stream<BusinessCardModel> stream;
  @override
  initState() {
    super.initState();
    stream = widget.stream;
    businessCardModel = widget.businessCardModel;
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: widget.childKey, 
      child: StreamBuilder(
      stream: stream,
      initialData: businessCardModel,
      builder: (context, snapshot) {
        businessCardModel = snapshot.data;
        return Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 10, 16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
            ),
            width: MediaQuery.of(context).size.width - 50,
            child: Padding(
              padding: EdgeInsets.all(10.0), 
              child: Flex(
                direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(businessCardModel.name, textScaleFactor: 1.3, style: TextStyle(color: widget.textColor)),
                        Text(businessCardModel.businessName, style: TextStyle(color: widget.textColor)),
                        Text(businessCardModel.phone, style: TextStyle(color: widget.textColor)),
                        Text(businessCardModel.businessInformation, style: TextStyle(color: widget.textColor)),
                        Text(businessCardModel.streetOne + " " + businessCardModel.streetTwo + " " + businessCardModel.city + " " + businessCardModel.state, style: TextStyle(color: widget.textColor)),
                        Text(businessCardModel.email, style: TextStyle(color: widget.textColor)),
                        Text(businessCardModel.website, style: TextStyle(color: widget.textColor))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
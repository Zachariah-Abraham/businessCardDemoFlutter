import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'BusinessCardModel.dart';
import './customWidgets/BusinessCardFormField.dart';

class BusinessCardForm extends StatefulWidget {
  const BusinessCardForm({
    Key key,
    this.businessName, 
    this.name, 
    this.phone, 
    this.businessInformation, 
    this.streetOne, 
    this.streetTwo, 
    this.city, 
    this.state, 
    this.email, 
    this.website,
    @required this.onBusinessCardModelChange,
  })  :
        super(key: key);

  final String businessName;
  final String name;
  final String phone;
  final String businessInformation;
  final String streetOne;
  final String streetTwo;
  final String city;
  final String state;
  final String email;
  final String website;
  final void Function(BusinessCardModel) onBusinessCardModelChange;
  
  @override
  _BusinessCardFormState createState() => _BusinessCardFormState();
}

class _BusinessCardFormState extends State<BusinessCardForm> {
  String businessName;
  String name;
  String phone;
  String businessInformation;
  String streetOne;
  String streetTwo;
  String city;
  String state;
  String email;
  String website;

  void Function(BusinessCardModel) onBusinessCardModelChange;
  BusinessCardModel businessCardModel;

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _businessInformationController = TextEditingController();
  final TextEditingController _streetOneController = TextEditingController();
  final TextEditingController _streetTwoController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  Color cursorColor;
  Color textColor;

  void createBusinessCardModel() {
    businessName = widget.businessName ?? '';
    name = widget.name ?? '';
    phone = widget.phone ?? '';
    businessInformation = widget.businessInformation ?? '';
    streetOne = widget.streetOne ?? '';
    streetTwo = widget.streetTwo ?? '';
    city = widget.city ?? '';
    state = widget.state ?? '';
    email = widget.email ?? '';
    website = widget.website ?? '';

    businessCardModel = BusinessCardModel(
      businessName, 
      name, 
      phone, 
      businessInformation, 
      streetOne, 
      streetTwo, 
      city, 
      state, 
      email, 
      website,
    );
  }

  @override
  void initState() {
    super.initState();

    createBusinessCardModel();
    cursorColor = Colors.blue;
    textColor = Colors.black;
    onBusinessCardModelChange = widget.onBusinessCardModelChange;

    _businessNameController.addListener(() {
      setState(() {
        businessName = _businessNameController.text;
        businessCardModel.businessName = businessName;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _nameController.addListener(() {
      setState(() {
        name = _nameController.text;
        businessCardModel.name = name;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _phoneController.addListener(() {
      setState(() {
        phone = _phoneController.text;
        businessCardModel.phone = phone;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _businessInformationController.addListener(() {
      setState(() {
        businessInformation = _businessInformationController.text;
        businessCardModel.businessInformation = businessInformation;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _streetOneController.addListener(() {
      setState(() {
        streetOne = _streetOneController.text;
        businessCardModel.streetOne = streetOne;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _streetTwoController.addListener(() {
      setState(() {
        streetTwo = _streetTwoController.text;
        businessCardModel.streetTwo = streetTwo;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _cityController.addListener(() {
      setState(() {
        city = _cityController.text;
        businessCardModel.city = city;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _stateController.addListener(() {
      setState(() {
        state = _stateController.text;
        businessCardModel.state = state;
        onBusinessCardModelChange(businessCardModel);
      });
    });
    
    _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
        businessCardModel.email = email;
        onBusinessCardModelChange(businessCardModel);
      });
    });

    _websiteController.addListener(() {
      setState(() {
        website = _websiteController.text;
        businessCardModel.website = website;
        onBusinessCardModelChange(businessCardModel);
      });
    });


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blue, 
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            makeContainer(_businessNameController, cursorColor, textColor, "Business Name", TextInputType.text, TextInputAction.next),
            makeContainer(_nameController, cursorColor, textColor, "Name", TextInputType.text, TextInputAction.next),  
            makeContainer(_phoneController, cursorColor, textColor, "Phone", TextInputType.text, TextInputAction.next),  
            makeContainer(_businessInformationController, cursorColor, textColor, "Business Information", TextInputType.text, TextInputAction.next),  
            makeContainer(_streetOneController, cursorColor, textColor, "Street 1", TextInputType.text, TextInputAction.next),  
            makeContainer(_streetTwoController, cursorColor, textColor, "Street 2", TextInputType.text, TextInputAction.next),  
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1, 
                  child: makeContainer(_cityController, cursorColor, textColor, "City", TextInputType.text, TextInputAction.next),  
                ),
                Expanded(
                  flex: 1,
                  child: makeContainer(_stateController, cursorColor, textColor, "State", TextInputType.text, TextInputAction.next),  
                ),
              ],
            ),
            makeContainer(_emailController, cursorColor, textColor, "Email", TextInputType.text, TextInputAction.next),  
            makeContainer(_websiteController, cursorColor, textColor, "Website", TextInputType.text, TextInputAction.next),  
          ],
        ),
      ),  
    );
  }
}
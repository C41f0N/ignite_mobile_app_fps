import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/main.dart';
import 'package:auto_size_text/auto_size_text.dart';


class DelegationLoginPage extends StatefulWidget {
  const DelegationLoginPage({Key? key}) : super(key: key);

  @override
  _DelegationLoginPageState createState() => _DelegationLoginPageState();
}

class _DelegationLoginPageState extends State<DelegationLoginPage> {

  bool _secureText = true;
  TextEditingController _delPassController = TextEditingController();
  TextEditingController _delNumberController = TextEditingController();
  String? _passwordError = null;
  String? _delNumberError = null;
  var _form1Key = GlobalKey<FormState>();
  var _form2Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AutoSizeText("Delegation Login",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          ),
          centerTitle: true,
          backgroundColor: mainAppbarColor,
          elevation: 5,
          shadowColor: Colors.black,
          toolbarHeight: _screenHeightConstant*9,
        ),


        body: Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/LoginScreenBackground.png',
                  )

              )
          ),
          child: Center(
            child: Container(
              height: _screenHeightConstant*61,
              width: _screenWidthConstant*76,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: _screenHeightConstant*3,
                  ),
                   const AutoSizeText(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    )
                  ),
                  SizedBox(
                    height: _screenHeightConstant*2.5,
                  ),
                  Image(
                    image: AssetImage('assets/user(login).png'),
                    height: _screenHeightConstant*15,
                    width: _screenWidthConstant*51,
                  ),
                  SizedBox(
                    height: _screenHeightConstant*2.5,
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenWidthConstant*7.63, vertical: _screenHeightConstant*0.652),
                    child: Form(
                      key: _form1Key,
                      child: TextFormField(
                        controller: _delNumberController,
                        decoration: InputDecoration(
                          errorText: _delNumberError,
                          border: OutlineInputBorder(),
                          //hintText: 'Delegation No.',
                          label: AutoSizeText("Delegation No."),
                        ),
                        maxLength: 2,
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenWidthConstant*7.63, vertical: _screenHeightConstant*0.652),
                    child: Form(
                      key: _form2Key,
                      child: TextFormField(
                        controller: _delPassController,
                        decoration: InputDecoration(
                          errorText: _passwordError,
                          border: OutlineInputBorder(),
                          //hintText: 'Password',
                          label: AutoSizeText("Password"),
                          suffixIcon: IconButton(
                            icon: Icon(_secureText ? Icons.remove_red_eye : Icons.security),
                            onPressed: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                        ),
                        ),
                        obscureText: _secureText,
                        maxLength: 10,

                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                      print("Del Num: " + _delNumberController.text);
                      print("Del ID: " + _delPassController.text);
                      var verifyCheck = await verifyInfo(_delNumberController.text, _delPassController.text);

                      setState(() {
                        String delNumString = _delNumberController.text;
                        _passwordError = null;
                        if( int.parse(delNumString) < 0 || int.parse(delNumString) > 99 ) {
                          _delNumberError = "Invalid del No.";
                        } else {
                          _delNumberError = null;
                          if (_delPassController.text.length < 10) {
                            _passwordError = "Enter 10 characters.";
                          } else if (verifyCheck)  {
                            print("Verified");
                            setGlobalDelNoToFile(delNumString);
                            setDelGroup();
                            setGlobalDelNo(delNumString);
                            subscribeToDelNotifications();
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/delegation_mode');
                          }
                          else if (!verifyCheck) {
                            _passwordError = "Incorrect password.";
                          }
                        }
                      });

                      // Navigator.pop(context, '/delegation_login');
                      // Navigator.pushNamed(context, '/delegation_mode');
                    },
                    child: const AutoSizeText(
                      'Login',
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: const Color(0xFF00437D)
                    ),

                  )

                ],
              )
            )
          )
        ),
      ),
    );
  }
}

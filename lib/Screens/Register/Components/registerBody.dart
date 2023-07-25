import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/buttons.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../HomePage.dart';
import '../../Login/login.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool emptyArea = false;

    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
///////////////////////////////////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 50).r,
                child: SizedBox(
                  width: 260.w,
                  child: Column(
                    children: [
                      Text(
                        "Register Now!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: mainFontSize.sp,
                          fontWeight: mainFontWeight,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Create an Account,Its free",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: commonTextSize.sp,
                          color: lightGreyReceiptBG,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
///////////////////////////////////////////////////////////////////////////////////

              SizedBox(width: double.infinity.w, height: 40.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ///////////////////////////////////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0).r,
                      child: SizedBox(
                        width: 220.w,
                        height: 90.h,
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              displaySnackBar(context,"enter your email");
                              emptyArea = true;
                              return "empty";
                            }
                            return null;
                          },
                          cursorColor: textBlack,
                          style: TextStyle(fontSize: subFontSize.sp),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: textBlack),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: textBlack),
                            ),
                            icon: const Icon(
                              Icons.person,
                              color: textBlack,
                            ),
                            labelText: "User Name",
                            hintText: "Ahmed Mohamed",
                            labelStyle: TextStyle(
                                color: textBlack,
                                fontSize: mainFontSize.sp,
                                fontWeight: mainFontWeight),
                            hintStyle: TextStyle(
                                color: textBlack, fontSize: subFontSize.sp),
                          ),
                          onChanged: (text){
                          },
                        ),
                      ),
                    ),
///////////////////////////////////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0).r,
                      child: SizedBox(
                        width: 220.w,
                        height: 90.h,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              displaySnackBar(context,"enter your email");
                              emptyArea = true;
                              return "empty";
                            }
                            return null;
                          },
                          cursorColor: textBlack,
                          style: TextStyle(fontSize: subFontSize.sp),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: textBlack),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: textBlack),
                            ),
                            icon: const Icon(
                              Icons.email_outlined,
                              color: textBlack,
                            ),
                            labelText: "Email",
                            hintText: "abc@gmail.com",
                            labelStyle: TextStyle(
                                color: textBlack,
                                fontSize: mainFontSize.sp,
                                fontWeight: mainFontWeight),
                            hintStyle: TextStyle(
                                color: textBlack, fontSize: subFontSize.sp),
                          ),
                          onChanged: (text){
                          },
                        ),
                      ),
                    ),
///////////////////////////////////////////////////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.only(right: 20.0).r,
                      child: SizedBox(
                        width: 220.w,
                        height: 90.h,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              displaySnackBar(context,"enter your email");
                              emptyArea = true;
                              return "empty";
                            }
                            return null;
                          },
                          cursorColor: textBlack,
                          style: TextStyle(fontSize: subFontSize.sp),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: textBlack),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: textBlack),
                            ),
                            icon: const Icon(
                              Icons.password_outlined,
                              color: textBlack,
                            ),
                            labelText: "Password",
                            hintText: "******",
                            labelStyle: TextStyle(
                                color: textBlack,
                                fontSize: mainFontSize.sp,
                                fontWeight: mainFontWeight),
                            hintStyle: TextStyle(
                                color: textBlack, fontSize: subFontSize.sp),
                          ),
                          onChanged: (text){
                          },
                        ),
                      ),
                    ),
///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: 30.h, width: double.infinity.w),
                    DefaultButton(
                        text: "Register",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            emptyArea = false;
                          }
                          if (emptyArea == false) {
                            await displaySnackBar(context,"loading");
                            // TODO: add your code to register by email & password and store the user data in firestore
                            userRegister(nameController.text, emailController.text, passwordController.text);

                          }
                        }),
///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: 20.h, width: double.infinity.w),
                    Text(
                      "Already have an account ?",
                      style: (TextStyle(
                          color: textBlack, fontSize: commonTextSize.sp)),
                    ),
///////////////////////////////////////////////////////////////////////////////////
                    InkWell(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: textBlack,
                            fontSize: commonTextSize.sp,
                            fontWeight: commonTextWeight),
                      ),
                      onTap: () {
                         Navigator.pushNamed(context, Login.routeName);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
  void userRegister(
      String name,
      String email,
      String password
      ) async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        createUser(name, email, password, value.user!.uid);
        print('the process is done successfully2');
        displaySnackBar(context,'the process is done successfully');
        Navigator.pushNamed(context, HomePage.routeName);
    }).catchError((error){
      displaySnackBar(context,error.toString());
      print(error.toString());
    });
  }
  void createUser(
      String name,
      String email,
      String password,
      String uId
      ){
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set({
      'userName' : name,
      'userEmail' : email,
      'userPassword' : password
    }).then((value) {
      print('the process is done successfuly');
    }).catchError((error){
      print(error.toString());
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../database/database_helper.dart';


class EmailInputScreen extends StatefulWidget {
  @override
  _EmailInputScreenState createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  TextEditingController _emailController = TextEditingController();
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _showStoredEmail();
  }

  Future<void> _showStoredEmail() async {
    String? email = await _dbHelper.getEmail();
    if (email != null) {
      Fluttertoast.showToast(
        msg: "Stored Email: $email",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lifespark Task',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),),
            Lottie.asset('assets/astronot.json', width: 400, height: 400),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Enter your email',
              suffixIcon: Icon(Icons.email_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () async {
                String email = _emailController.text;
                await _dbHelper.saveEmail(email);
                Fluttertoast.showToast(
                  msg: "Email Saved: $email",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(

                  color: Colors.black12,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.black87,width: 2)

                ),
                child: Text('Save Email', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

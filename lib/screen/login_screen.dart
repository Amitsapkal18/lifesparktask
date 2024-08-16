import 'package:flutter/material.dart';
import '../firebase_auth/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController otpController = TextEditingController();

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lifespark Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(

              onTap: () {
                _controller.verifyPhoneNumber(context, phoneController.text);
              },
              child: Container(
                height: 40,
                width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(

                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black87,width: 2)

                ),
                child: Text('OTP send', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  prefixIcon: Icon(Icons.storage_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _controller.signInWithOTP(context, otpController.text);
              },
              child: Container(
                height: 40,
                width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(

                    color: Colors.black12,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black87,width: 2)

                ),
                child: Text('Login', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

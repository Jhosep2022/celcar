import 'package:celcar/presentation/screens/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                'Ingresa el código de confirmación',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {
                  print(value);
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.blue.shade50,
                  inactiveFillColor: Colors.blue.shade100,
                  activeColor: Colors.blue,
                  selectedColor: Colors.blue,
                  inactiveColor: Colors.blue.shade200,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              
              TextButton(
                onPressed: () {
                  
                },
                child: Text(
                  'Enviar nuevo código',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:celcar/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon(
                Icons.directions_car,
                size: 100,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              
              Text(
                'CELCAR',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Ingresa tu celular',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'MX',
                onChanged: (phone) {
                  print(phone.completeNumber); 
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  Expanded(
                    child: Text(
                      'He leído y acepto los términos y condiciones, y aviso de privacidad',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen()),
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

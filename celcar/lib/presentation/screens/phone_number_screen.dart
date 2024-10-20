import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Configuraciones', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título de la pantalla
            Center(
              child: Column(
                children: [
                  Text(
                    'Número de teléfono',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Puede cambiar su número de teléfono aquí',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Su cuenta y toda la información se transferirán al número nuevo',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Input de número telefónico con IntlPhoneField
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Nuevo número de teléfono',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'MX', // Configuración inicial para México
              onChanged: (phone) {
                setState(() {
                  phoneNumber = phone.completeNumber; // Guardamos el número completo
                });
              },
            ),
            SizedBox(height: 20),

            // Mensaje de verificación
            Text(
              'Le enviaremos un código de verificación',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Spacer(),

            // Botón de "Siguiente"
            ElevatedButton(
              onPressed: () {
                // Acción para el botón de siguiente, aquí puedes manejar la lógica del OTP
                if (phoneNumber != null && phoneNumber!.isNotEmpty) {
                  // Aquí iría el código para procesar el número
                  print('Número de teléfono seleccionado: $phoneNumber');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.lightBlue,
              ),
              child: Text(
                'Siguiente',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

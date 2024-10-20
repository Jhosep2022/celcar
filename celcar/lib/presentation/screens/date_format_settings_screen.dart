import 'package:flutter/material.dart';

class DateFormatSettingsScreen extends StatefulWidget {
  @override
  _DateFormatSettingsScreenState createState() => _DateFormatSettingsScreenState();
}

class _DateFormatSettingsScreenState extends State<DateFormatSettingsScreen> {
  bool _is24HourFormat = true; // Formato de 24 horas activado
  String _selectedDistanceUnit = 'kilometros'; // Unidades de distancia por defecto

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
        title: Text('Configuraciones'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Switch para formato de 24 horas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Formato de 24 horas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _is24HourFormat,
                  onChanged: (bool value) {
                    setState(() {
                      _is24HourFormat = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Sección de "Unidades de distancia"
            Text(
              'Unidades de distancia',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Opción de kilómetros
            ListTile(
              title: Text(
                'En kilómetros',
                style: TextStyle(
                  fontWeight: _selectedDistanceUnit == 'kilometros' ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: _selectedDistanceUnit == 'kilometros'
                  ? Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                setState(() {
                  _selectedDistanceUnit = 'kilometros';
                });
              },
            ),
            // Opción de millas
            ListTile(
              title: Text(
                'En millas',
                style: TextStyle(
                  fontWeight: _selectedDistanceUnit == 'millas' ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: _selectedDistanceUnit == 'millas'
                  ? Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                setState(() {
                  _selectedDistanceUnit = 'millas';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

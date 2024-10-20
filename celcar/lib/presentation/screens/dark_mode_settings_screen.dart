import 'package:flutter/material.dart';

class DarkModeSettingsScreen extends StatefulWidget {
  @override
  _DarkModeSettingsScreenState createState() => _DarkModeSettingsScreenState();
}

class _DarkModeSettingsScreenState extends State<DarkModeSettingsScreen> {
  String _selectedOption = 'sistema'; // Opción predeterminada

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
            // Título de la pantalla
            Text(
              'Modo Nocturno',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Opción "Desactivado"
            ListTile(
              title: Text(
                'Desactivado',
                style: TextStyle(
                  fontWeight: _selectedOption == 'desactivado' ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: _selectedOption == 'desactivado'
                  ? Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                setState(() {
                  _selectedOption = 'desactivado';
                });
              },
            ),

            // Opción "Siempre activo"
            ListTile(
              title: Text(
                'Siempre activo',
                style: TextStyle(
                  fontWeight: _selectedOption == 'activo' ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: _selectedOption == 'activo'
                  ? Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                setState(() {
                  _selectedOption = 'activo';
                });
              },
            ),

            // Opción "Según el sistema"
            ListTile(
              title: Text(
                'Según el sistema',
                style: TextStyle(
                  fontWeight: _selectedOption == 'sistema' ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: _selectedOption == 'sistema'
                  ? Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                setState(() {
                  _selectedOption = 'sistema';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

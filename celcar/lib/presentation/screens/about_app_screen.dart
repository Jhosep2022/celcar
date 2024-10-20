import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
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
            Text(
              'Acerca de la App',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Opción "Reglas"
            ListTile(
              title: Text('Reglas'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                // Acción al presionar "Reglas"
              },
            ),

            // Opción "Términos y condiciones"
            ListTile(
              title: Text('Términos y condiciones'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                // Acción al presionar "Términos y condiciones"
              },
            ),

            // Opción "Licencias"
            ListTile(
              title: Text('Licencias'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                // Acción al presionar "Licencias"
              },
            ),

            // Opción "Política de privacidad"
            ListTile(
              title: Text('Política de privacidad'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                // Acción al presionar "Política de privacidad"
              },
            ),

            Spacer(),

            // Versión de la App
            Center(
              child: Text(
                'Versión 6.16.0',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

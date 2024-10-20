import 'package:flutter/material.dart';

class SeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Aquí puedes agregar la funcionalidad para abrir el menú lateral
          },
        ),
        title: Text('Seguridad y protección'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            // Icono de Seguridad en el centro
            Icon(
              Icons.security,
              color: Colors.blue,
              size: 80,
            ),
            SizedBox(height: 20),
            // Texto ¿A quién deseas contactar?
            Text(
              '¿A quién deseas contactar?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            
            // Lista de opciones (Emergencia, Policía, Soporte)
            _buildOption('Emergencia', context),
            _buildOption('Policía', context),
            _buildOption('Mensaje a soporte', context),
          ],
        ),
      ),
    );
  }

  // Función para construir cada opción de contacto
  Widget _buildOption(String title, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // Aquí puedes agregar la funcionalidad de redirección
        // Ejemplo: Si es "Emergencia", abre un número de emergencia
        if (title == 'Emergencia') {
          // Acción para Emergencia
        } else if (title == 'Policía') {
          // Acción para Policía
        } else if (title == 'Mensaje a soporte') {
          // Acción para Mensaje a soporte
        }
      },
    );
  }
}

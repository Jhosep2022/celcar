import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            Center(
              child: Text(
                'Idioma',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            
            // Opción de idioma en inglés
            ListTile(
              title: Text('English', style: TextStyle(fontSize: 20)),
              subtitle: Text('Inglés'),
              onTap: () {
                // Acción cuando se selecciona el idioma Inglés
                _showConfirmationDialog(context, 'English');
              },
            ),
            Divider(),

            // Opción de idioma en francés
            ListTile(
              title: Text('Français', style: TextStyle(fontSize: 20)),
              subtitle: Text('Francés'),
              onTap: () {
                // Acción cuando se selecciona el idioma Francés
                _showConfirmationDialog(context, 'Français');
              },
            ),
            Divider(),

            // Opción de idioma en español
            ListTile(
              title: Text('Español', style: TextStyle(fontSize: 20)),
              subtitle: Text('Español'),
              onTap: () {
                // Acción cuando se selecciona el idioma Español
                _showConfirmationDialog(context, 'Español');
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  // Función para mostrar el cuadro de diálogo de confirmación
  void _showConfirmationDialog(BuildContext context, String language) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar cambio de idioma'),
          content: Text('¿Estás seguro de que deseas cambiar el idioma a $language?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                // Aquí podrías agregar la lógica para cambiar el idioma
              },
              child: Text('Sí, cambiar'),
            ),
          ],
        );
      },
    );
  }
}

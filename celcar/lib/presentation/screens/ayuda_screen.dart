import 'package:flutter/material.dart';
import 'chat_support_screen.dart'; // Asegúrate de importar la pantalla de ChatSupportScreen

class AyudaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Asistencia',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Los lavadores no responden'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                // Acción al presionar la opción de asistencia
              },
            ),
            ListTile(
              title: Text('Cómo contactarme con un operador'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                // Acción al presionar la opción de cómo contactarse con un operador
              },
            ),
            ListTile(
              title: Text('Cómo dejarle un comentario a un operador'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                // Acción al presionar la opción de cómo dejar un comentario
              },
            ),
            SizedBox(height: 20),
            Text(
              'Realimentación',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline, color: Colors.blue),
              title: Text('Escribir al equipo de soporte'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatSupportScreen()), // Redirigir a la nueva pantalla de chat
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.email_outlined, color: Colors.blue),
              title: Text('Escribir al correo electrónico'),
              onTap: () {
                _showEmailDialog(context); // Muestra el diálogo al escribir un correo
              },
            ),
          ],
        ),
      ),
    );
  }

  // Función para mostrar el diálogo de correo electrónico
  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escribir al correo electrónico'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Escribe tu Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Asunto',
                    hintText: 'Escribe tu asunto',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Tu pregunta',
                    hintText: 'Escribe tu pregunta',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _showCloseConfirmationDialog(context); // Mostrar confirmación de cierre
              },
              child: Text('Cerrar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí se puede agregar la lógica para enviar el correo
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo después de enviar
              },
              child: Text('Enviar'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar el cuadro de confirmación de cierre
  void _showCloseConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Está seguro de que quiere cerrar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo de confirmación
              },
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo de confirmación
                Navigator.of(context).pop(); // Cierra el diálogo principal
              },
              child: Text('Sí'),
            ),
          ],
        );
      },
    );
  }
}

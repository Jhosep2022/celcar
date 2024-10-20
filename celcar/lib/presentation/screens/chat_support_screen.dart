import 'package:flutter/material.dart';

class ChatSupportScreen extends StatefulWidget {
  @override
  _ChatSupportScreenState createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // Icono de menú (sándwich)
          onPressed: () {
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
        title: Text('Asistencia por Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // Aquí irá la lista de mensajes en el chat
              color: Colors.white, // Fondo blanco para la zona del chat
              child: Center(
                child: Text(
                  "Aquí se mostrará la conversación", // Placeholder de mensajes
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue), // Icono de enviar
                  onPressed: () {
                    // Aquí va la lógica para enviar el mensaje
                    String message = _messageController.text;
                    if (message.isNotEmpty) {
                      print("Mensaje enviado: $message");
                      _messageController.clear(); // Limpiar el campo de texto
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

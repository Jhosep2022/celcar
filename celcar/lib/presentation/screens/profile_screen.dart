import 'package:celcar/presentation/screens/ayuda_screen.dart';
import 'package:celcar/presentation/screens/mis_servicios_screen.dart';
import 'package:celcar/presentation/screens/seguridad_screen.dart';
import 'package:celcar/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'request_operator_screen.dart'; // Asegúrate de importar la pantalla de solicitud de operador

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Perfil del usuario con calificación
            GestureDetector(
              onTap: _pickImage,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue.shade100,
                    backgroundImage:
                        _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.blue,
                          )
                        : null,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jorge Arturo',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star_half, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text('4.9 (70)',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.purple),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Lista de opciones con iconos
            Expanded(
              child: ListView(
                children: [
                  _buildOption(Icons.build, "MIS SERVICIOS", context),
                  _buildOption(Icons.location_city, "CIUDAD", context),
                  _buildOption(Icons.help_outline, "AYUDA", context),
                  _buildOption(Icons.lock_outline, "SEGURIDAD", context),
                  _buildOption(Icons.settings, "CONFIGURACIÓN", context),
                  _buildOption(Icons.support_agent, "SOPORTE", context),
                ],
              ),
            ),

            // Productos y botón inferior
            Column(
              children: [
                Divider(thickness: 1),
                Text(
                  'PRODUCTOS DONGARES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el botón
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Color de fondo
                    foregroundColor: Colors.white, // Color del texto
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text('MODO USUARIO'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para cada opción con icono y texto
  Widget _buildOption(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: 30),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {
        if (title == "CIUDAD") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RequestOperatorScreen()),
          );
        } else if (title == "MIS SERVICIOS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MisServiciosScreen()),
          );
        } else if (title == "SEGURIDAD") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeguridadScreen()),
          );
        } else if (title == "CONFIGURACIÓN") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        } else if (title == "AYUDA") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AyudaScreen()), // Redirigir a la nueva pantalla de ayuda
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Perfil del usuario con calificación
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
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
            SizedBox(height: 20),
            
            // Lista de opciones con iconos
            Expanded(
              child: ListView(
                children: [
                  _buildOption(Icons.build, "MIS SERVICIOS"),
                  _buildOption(Icons.location_city, "CIUDAD"),
                  _buildOption(Icons.help_outline, "AYUDA"),
                  _buildOption(Icons.lock_outline, "SEGURIDAD"),
                  _buildOption(Icons.settings, "CONFIGURACION"),
                  _buildOption(Icons.support_agent, "SOPORTE"),
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
  Widget _buildOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: 30),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {
        // Acción al seleccionar la opción
      },
    );
  }
}

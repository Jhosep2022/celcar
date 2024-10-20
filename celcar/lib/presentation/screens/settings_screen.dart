import 'package:celcar/presentation/screens/language_screen.dart';
import 'package:flutter/material.dart';
import 'phone_number_screen.dart'; // Asegúrate de importar tu pantalla de PhoneNumberScreen
import 'about_app_screen.dart'; // Importa la pantalla AboutAppScreen
import 'date_format_settings_screen.dart'; // Importa la pantalla de Formato de fecha
import 'dark_mode_settings_screen.dart'; // Importa la pantalla de Modo Nocturno
import 'login_screen.dart'; // Importa la pantalla de LoginScreen

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Función para abrir el menú lateral
          },
        ),
        title: Text('Configuraciones'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lista de opciones de configuración
            _buildOption(context, 'Número de teléfono', _showConfirmationDialog),
            _buildOption(context, 'Idioma', _navigateToLanguageScreen),
            _buildOption(context, 'Formato de fecha y unidades de medidas', _navigateToDateFormatScreen),
            _buildOption(context, 'Modo nocturno', _navigateToDarkModeScreen),
            _buildOption(context, 'Acerca de la aplicación', _navigateToAboutAppScreen), // Redirige a AboutAppScreen
            Spacer(),
            
            // Botón "Cerrar sesión"
            ElevatedButton(
              onPressed: () {
                _showLogoutDialog(context); // Mostrar diálogo de confirmación para cerrar sesión
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Botón "Eliminar mi cuenta"
            ElevatedButton(
              onPressed: () {
                _showDeleteAccountDialog(context); // Mostrar diálogo de confirmación para eliminar cuenta
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.redAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ELIMINAR MI CUENTA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función que crea una opción de la lista de configuraciones
  Widget _buildOption(BuildContext context, String title, Function? onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
      onTap: onTap != null ? () => onTap(context) : null, // Llama a la función onTap si existe
    );
  }

  // Función para mostrar un cuadro de diálogo de confirmación para cambiar número de teléfono
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar cambio de pantalla'),
          content: Text('¿Estás seguro de que deseas cambiar a la pantalla de Número de Teléfono?'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhoneNumberScreen()), // Cambia a la nueva pantalla
                );
              },
              child: Text('Sí, continuar'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar un cuadro de diálogo de confirmación para cerrar sesión
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cerrar sesión'),
          content: Text('¿Estás seguro de que deseas cerrar sesión?'),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), // Redirige a la pantalla de inicio de sesión
                );
              },
              child: Text('Sí, cerrar sesión'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar un cuadro de diálogo de confirmación para eliminar la cuenta
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar cuenta'),
          content: Text('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.'),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), // Redirige a la pantalla de inicio de sesión
                );
                // Aquí puedes añadir la lógica para eliminar la cuenta del usuario
              },
              child: Text('Sí, eliminar cuenta'),
            ),
          ],
        );
      },
    );
  }

  // Función para navegar a la pantalla de selección de idioma
  void _navigateToLanguageScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LanguageScreen()), // Navegación a LanguageScreen
    );
  }

  // Función para navegar a la pantalla de formato de fecha y unidades
  void _navigateToDateFormatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DateFormatSettingsScreen()), // Navegación a la pantalla de Formato de fecha
    );
  }

  // Función para navegar a la pantalla de modo nocturno
  void _navigateToDarkModeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DarkModeSettingsScreen()), // Navegación a la pantalla de Modo Nocturno
    );
  }

  // Función para navegar a la pantalla Acerca de la App
  void _navigateToAboutAppScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutAppScreen()), // Navegación a la pantalla Acerca de la App
    );
  }
}

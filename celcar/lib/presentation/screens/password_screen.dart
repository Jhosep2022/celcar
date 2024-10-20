import 'package:celcar/presentation/screens/profile_screen.dart';
import 'package:celcar/presentation/screens/user_form_screen.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Texto de encabezado
              Text(
                'Crea tu contraseña',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              
              // Campo para ingresar la contraseña
              TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Debe contener de 8 a 16 caracteres',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              
              // Botón "Siguiente"
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserFormScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color de fondo
                  foregroundColor: Colors.white, // Color del texto
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

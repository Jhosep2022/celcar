import 'package:celcar/presentation/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'vehicle_form_screen.dart'; // Asegúrate de importar la pantalla del formulario del vehículo

class RequestOperatorScreen extends StatefulWidget {
  @override
  _RequestOperatorScreenState createState() => _RequestOperatorScreenState();
}

class _RequestOperatorScreenState extends State<RequestOperatorScreen> {
  String _selectedVehicle = 'SEDAN'; // Vehículo seleccionado
  String _userComment = ''; // Comentario del usuario

  // Lista de servicios y sus precios
  final List<Map<String, dynamic>> _services = [
    {"service": "Lavado Exterior", "price": 50.0},
    {"service": "Lavado Interior", "price": 30.0},
    {"service": "Encerado", "price": 20.0},
  ];

  // Función para calcular la suma total de los precios
  double _calculateTotal() {
    return _services.fold(0, (sum, service) => sum + service["price"]);
  }

  // Función para mostrar el cuadro de comentarios
  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Comentarios para el Operador'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _userComment = value; // Almacenar el comentario
              });
            },
            maxLines: 3,
            decoration: InputDecoration(
              hintText:
                  'Ingrese sus comentarios (ej: Pago por transferencia bancaria)',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                print("Comentario enviado: $_userComment");
              },
              child: Text("Enviar"),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar los métodos de pago
  void _showPaymentOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccione un método de pago'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Tarjeta Débito'),
                onTap: () {
                  Navigator.of(context).pop();
                  print("Pago con Tarjeta Débito seleccionado");
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card_outlined),
                title: Text('Tarjeta Crédito'),
                onTap: () {
                  Navigator.of(context).pop();
                  print("Pago con Tarjeta Crédito seleccionado");
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('PayPal'),
                onTap: () {
                  Navigator.of(context).pop();
                  print("Pago con PayPal seleccionado");
                },
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text('Efectivo'),
                onTap: () {
                  Navigator.of(context).pop();
                  print("Pago en Efectivo seleccionado");
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar el desglose de servicios
  void _showServiceBreakdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Desglose de Servicios'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _services.map((service) {
              return ListTile(
                title: Text(service["service"]),
                trailing: Text("\$${service["price"]}"),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CIUDAD'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mapa interactivo usando flutter_map
            Container(
              height: 400,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter:
                      LatLng(18.466333, -97.392502), // Coordenadas iniciales
                  initialZoom: 14.0, // Nivel de zoom inicial
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  const MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(18.466333, -97.392502),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Barra de selección de vehículos
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildVehicleOption('SEDAN', Icons.directions_car),
                  _buildVehicleOption('PICK UP', Icons.local_shipping),
                  _buildVehicleOption('SUV', Icons.car_crash_rounded),
                  _buildVehicleOption('JEEP', Icons.directions_bus),
                  _buildVehicleOption('CAMIÓN', Icons.local_shipping),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Información de la ubicación, tarifa, comentarios, y método de pago
            _buildInfoRow(Icons.location_on, 'SANTIAGO TUXTLA 9'),
            GestureDetector(
              onTap: _showServiceBreakdown, // Mostrar desglose al presionar
              child: _buildInfoRow(Icons.attach_money, 'TARIFA A PAGAR'),
            ),
            GestureDetector(
              onTap: _showCommentDialog, // Mostrar sección de comentarios
              child: _buildInfoRow(Icons.comment, 'COMENTARIOS'),
            ),
            GestureDetector(
              onTap:
                  _showPaymentOptions, // Mostrar métodos de pago al presionar "Efectivo"
              child: _buildInfoRow(Icons.payment, 'EFECTIVO'),
            ),
            Spacer(),

            // Botón "Solicitar Operador"
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'SOLICITAR OPERADOR',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para opciones de vehículos
  Widget _buildVehicleOption(String label, IconData icon) {
    bool isSelected = _selectedVehicle == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedVehicle = label;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VehicleFormScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: isSelected ? Colors.red : Colors.grey),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para mostrar íconos y textos de la información
  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

import 'package:celcar/presentation/screens/request_operator_screen.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  final String? selectedBrand;
  final String? selectedModel;
  final String? selectedExteriorColor;
  final String? selectedInteriorColor;
  final String? selectedYear;

  ServicesScreen({
    this.selectedBrand,
    this.selectedModel,
    this.selectedExteriorColor,
    this.selectedInteriorColor,
    this.selectedYear,
  });

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  // Lista de servicios con precios
  final List<Map<String, dynamic>> services = [
    {"name": "Lavado Con Shampoo", "price": 100, "selected": false},
    {"name": "Abrillantado", "price": 80, "selected": false},
    {"name": "Alto Brillo", "price": 60, "selected": false},
    {"name": "Desmanchado", "price": 120, "selected": false},
    {"name": "Lavado Exterior", "price": 50, "selected": false},
    {"name": "Lavado Interior", "price": 70, "selected": false},
  ];

  // Función para calcular el total a pagar
  int _calculateTotal() {
    int total = 0;
    for (var service in services) {
      if (service['selected']) {
        total += service['price'] as int;
      }
    }
    return total;
  }

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
        title: Row(
          children: [
            Icon(Icons.local_car_wash, color: Colors.blue),
            SizedBox(width: 10),
            Text('Servicios'),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Muestra la selección de vehículo
            Text(
              'Vehículo seleccionado: ${widget.selectedBrand} ${widget.selectedModel}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Lista de servicios con Checkbox
            Expanded(
              child: ListView(
                children: services.map((service) {
                  return CheckboxListTile(
                    title: Text(service['name']),
                    value: service['selected'],
                    onChanged: (bool? value) {
                      setState(() {
                        service['selected'] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),

            // Dos botones en la parte inferior
            Row(
              children: [
                // Botón Total a Pagar
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final total = _calculateTotal();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Total a Pagar'),
                            content: Text('Total a pagar es: \$${total}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL A PAGAR \$${_calculateTotal()}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Botón de "Continuar" con icono
                ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestOperatorScreen()),
                    );
                    },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    backgroundColor: Colors.blue,
                  ),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

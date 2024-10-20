import 'package:celcar/presentation/screens/asistencia_screen.dart';
import 'package:flutter/material.dart';

class VehicleFormScreen extends StatefulWidget {
  @override
  _VehicleFormScreenState createState() => _VehicleFormScreenState();
}

class _VehicleFormScreenState extends State<VehicleFormScreen> {
  String? _selectedBrand;
  String? _selectedModel;
  String? _selectedExteriorColor;
  String? _selectedInteriorColor;
  String? _selectedYear;

  

  final List<String> brands = ['Toyota', 'Honda', 'Ford', 'Chevrolet', 'Nissan'];
  final List<String> models = ['Corolla', 'Civic', 'F-150', 'Silverado', 'Altima'];
  final List<String> exteriorColors = ['Blanco', 'Negro', 'Azul', 'Rojo', 'Gris'];
  final List<String> interiorColors = ['Beige', 'Negro', 'Gris', 'Café'];
  final List<String> years = ['2020', '2021', '2022', '2023', '2024'];

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
        title: Text('Sedán'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown para Marca
            _buildDropdown('MARCA', _selectedBrand, brands, (value) {
              setState(() {
                _selectedBrand = value;
              });
            }),
            SizedBox(height: 10),

            // Dropdown para Modelo
            _buildDropdown('MODELO', _selectedModel, models, (value) {
              setState(() {
                _selectedModel = value;
              });
            }),
            SizedBox(height: 10),

            // Dropdown para Color Exterior
            _buildDropdown('COLOR EXTERIOR', _selectedExteriorColor, exteriorColors, (value) {
              setState(() {
                _selectedExteriorColor = value;
              });
            }),
            SizedBox(height: 10),

            // Dropdown para Color Interior
            _buildDropdown('COLOR INTERIOR', _selectedInteriorColor, interiorColors, (value) {
              setState(() {
                _selectedInteriorColor = value;
              });
            }),
            SizedBox(height: 10),

            // Dropdown para Año
            _buildDropdown('AÑO', _selectedYear, years, (value) {
              setState(() {
                _selectedYear = value;
              });
            }),
            SizedBox(height: 30),

            // Botón "Siguiente"
            ElevatedButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesScreen(
                  selectedBrand: _selectedBrand,
                  selectedModel: _selectedModel,
                  selectedExteriorColor: _selectedExteriorColor,
                  selectedInteriorColor: _selectedInteriorColor,
                  selectedYear: _selectedYear,
                  )),
                );
                },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue[900],
              ),
              child: Text(
                'SIGUIENTE',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear los DropdownButton
  Widget _buildDropdown(String label, String? selectedValue, List<String> items, Function(String?) onChanged) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

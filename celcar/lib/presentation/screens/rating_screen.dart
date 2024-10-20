import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 0; // Número de estrellas seleccionadas
  List<String> _selectedCompliments = []; // Lista de elogios seleccionados

  final List<String> compliments = [
    'EXCELENTE LAVADO',
    'PUNTUAL',
    'CONCLUYÓ EN TIEMPO',
    'RECOMENDABLE',
  ];

  // Función para manejar la selección de estrellas
  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  // Función para manejar la selección de elogios
  void _toggleCompliment(String compliment) {
    setState(() {
      if (_selectedCompliments.contains(compliment)) {
        _selectedCompliments.remove(compliment);
      } else {
        _selectedCompliments.add(compliment);
      }
    });
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
        title: Text('Calificar Operador'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen de perfil
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue[100],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),

            // Nombre del usuario
            Text(
              'Jorge Arturo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Estrellas de calificación
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  onPressed: () {
                    _setRating(index + 1); // Asigna la calificación basada en la estrella seleccionada
                  },
                );
              }),
            ),
            SizedBox(height: 10),

            // Título de elogio
            Text(
              'HAGA UN ELOGIO AL OPERADOR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),

            // Botones de elogio
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: compliments.map((compliment) {
                bool isSelected = _selectedCompliments.contains(compliment);
                return ElevatedButton(
                  onPressed: () {
                    _toggleCompliment(compliment);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isSelected ? Colors.blue[300] : Colors.blue[100],
                  ),
                  child: Text(
                    compliment,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),

            // Botón "Calificar"
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón Calificar
                print("Calificación: $_rating estrellas");
                print("Elogios: $_selectedCompliments");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'CALIFICAR',
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
}

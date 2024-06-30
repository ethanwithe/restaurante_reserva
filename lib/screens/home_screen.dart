import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurante_reserva/models/Restaurante.dart';
import 'package:restaurante_reserva/screens/confirmation_screen.dart';
import 'package:restaurante_reserva/widgets/custom_dropdown.dart';
import 'menu_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedRestaurante = '';
  String _selectedMesa = '';
  double _precioMesa = 0.0;
  String _horaReserva = '';
  String _fechaReserva = '';

  List<Restaurante> reservaciones = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservación de Mesa'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 350.0,
          height: 650,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 132, 246, 206),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Restaurante',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                CustomDropdown(
                  items: ['Maido', 'Mayta', 'Astrid & Gaston', 'Kjolle', 'Isolina'],
                  onChanged: (value) {
                    setState(() {
                      _selectedRestaurante = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  'Tipo de Mesa',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                CustomDropdown(
                  items: [
                    'Para 2 personas',
                    'Para 4 personas',
                    'Para 6 personas',
                    'Para 8 personas',
                    'Para 10 a 20 personas'
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedMesa = value;
                      _precioMesa = _getPrecioMesa(value);
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  'Precio',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\S/$_precioMesa soles',
                  style: TextStyle(fontSize: 18.0, color: Colors.green),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Hora y Fecha de Reserva',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  onChanged: (value) {
                    _horaReserva = value;
                  },
                  decoration: InputDecoration(labelText: 'Hora'),
                ),
                TextField(
                  onChanged: (value) {
                    _fechaReserva = value;
                  },
                  decoration: InputDecoration(labelText: 'Fecha'),
                ),
                
                SizedBox(height: 20.0),
                ElevatedButton(
                  
                  onPressed: _confirmarReserva,
                  child: Text('Enviar'),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getPrecioMesa(String tipoMesa) {
    switch (tipoMesa) {
      case 'Para 2 personas':
        return 50.0;
      case 'Para 4 personas':
        return 100.0;
      case 'Para 6 personas':
        return 150.0;
      case 'Para 8 personas':
        return 200.0;
      case 'Para 10 a 20 personas':
        return 300.0;
      default:
        return 0.0;
    }
  }

  void _confirmarReserva() async {
    if (_selectedRestaurante.isNotEmpty &&
        _selectedMesa.isNotEmpty &&
        _horaReserva.isNotEmpty &&
        _fechaReserva.isNotEmpty &&
        _precioMesa > 0.0) {
      Restaurante reserva = Restaurante(
        restaurante: _selectedRestaurante,
        tipoMesa: _selectedMesa,
        precio: _precioMesa,
        hora: _horaReserva,
        fecha: _fechaReserva,
        comentarios: '', // Puedes añadir aquí la lógica para los comentarios
      );
      reservaciones.add(reserva);

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/reservas.txt');

      // Convertir cada reserva en una línea de texto y escribir en el archivo
      String reservasString = reservaciones.map((e) => e.toString()).join('\n');
      await file.writeAsString(reservasString);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(reserva: reserva),
        ),
      );
    } else {
      // Manejar caso donde no se completaron todos los campos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Por favor completa todos los campos antes de enviar el pedido.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

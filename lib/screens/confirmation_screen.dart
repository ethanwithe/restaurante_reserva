import 'package:flutter/material.dart';
import '../models/Restaurante.dart';

class ConfirmationScreen extends StatelessWidget {
  final Restaurante reserva;

  const ConfirmationScreen({super.key, required this.reserva});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmación'),
      ),
     body: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Table(
    columnWidths: {
      0: FlexColumnWidth(), // Ajusta el ancho de la primera columna según el contenido
      1: FlexColumnWidth(), // Ajusta el ancho de la segunda columna según el contenido
    },
    children: [
      TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Restaurante:'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('${reserva.restaurante}'),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Tipo de Mesa:'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('${reserva.tipoMesa}'),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Precio:'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('\$${reserva.precio} soles'),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Hora:'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('${reserva.hora}'),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Fecha:'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('${reserva.fecha}'),
            ),
          ),
        ],
      ),
      
      TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text('¡Gracias por su reserva!'),
            ),
          ),
          TableCell(
            child: Container(), // Espacio vacío para la segunda columna
          ),
        ],
      ),
    ],
  ),
),

    );
  }
}

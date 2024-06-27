import 'package:flutter/src/material/data_table.dart';

class Restaurante {
  final String restaurante;
  final String tipoMesa;
  final double precio;
  final String hora;
  final String fecha;
  final String comentarios;

  Restaurante({
    required this.restaurante,
    required this.tipoMesa,
    required this.precio,
    required this.hora,
    required this.fecha,
    required this.comentarios,
  });

  @override
  String toString() {
    return 'Restaurante: $restaurante, Tipo de Mesa: $tipoMesa, Precio: $precio, Hora: $hora, Fecha: $fecha, Comentarios: $comentarios';
  }

  static map(DataRow Function(dynamic reserva) param0) {}
}

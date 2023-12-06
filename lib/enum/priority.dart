import 'package:flutter/material.dart';

enum Priority {
  low(name: 'Baixa', color: Color.fromRGBO(187, 222, 251, 1), dbName: 'low'),
  medium(name: 'Média', color: Color.fromRGBO(255, 236, 179, 1), dbName: 'medium'),
  high(name: 'Alta', color: Color.fromRGBO(255, 205, 210, 1), dbName: 'high');

  const Priority({
    required this.name,
    required this.color,
    required this.dbName,
  });

  final String name;
  final Color color;
  final String dbName;

}

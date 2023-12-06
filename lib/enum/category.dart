import 'package:flutter/material.dart';

enum Category {
  compras (name: 'Compras', color: Color.fromRGBO(255, 131, 7, 1), dbName: 'compras'),
  casa (name: 'Casa', color: Color.fromRGBO(233, 30, 99, 1), dbName: 'casa'),
  estudos (name: 'Estudos', color: Color.fromRGBO(156, 39, 176, 1), dbName: 'estudos'),
  saude (name: 'Saúde', color: Color.fromRGBO(33, 150, 243, 1), dbName: 'saude'),
  trabalho(name: 'Trabalho', color: Color.fromRGBO(5, 96, 8, 1), dbName: 'trabalho');

 const Category({
  required this.name,
  required this.color,
  required this.dbName,
 });

 final String name;
 final Color color;
 final String dbName;

}

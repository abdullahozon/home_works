// lib/main.dart

import 'package:fake_store/cubit/product_cubit.dart';
import 'package:fake_store/services/product_service.dart';
import 'package:fake_store/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<ProductCubit>(
      create: (_) => ProductCubit()..fetchAll(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
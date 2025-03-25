import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/catalogue_screen.dart';
import 'screens/cart_screen.dart';
import 'blocs/cart_bloc.dart';

void main() {
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart App',
        initialRoute: '/',
        routes: {
          '/': (context) => CatalogueScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}

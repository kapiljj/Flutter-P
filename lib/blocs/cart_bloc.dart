import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';

class CartEvent {}

class AddToCart extends CartEvent {
  final Product product;
  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final Product product;
  RemoveFromCart(this.product);
}

class CartState {
  final List<Product> cartItems;

  CartState(this.cartItems);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddToCart>((event, emit) {
      final updatedCart = List<Product>.from(state.cartItems)..add(event.product);
      emit(CartState(updatedCart));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedCart = List<Product>.from(state.cartItems)..remove(event.product);
      emit(CartState(updatedCart));
    });
  }
}

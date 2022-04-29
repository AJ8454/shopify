import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopify/models/models.dart';
import 'package:shopify/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProduct) {
      yield* _mapLoadProductToState();
    }
    if (event is UpdateProduct) {
      yield* _mapUpdateProductToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductToState() async* {
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getAllProduct()
        .listen((product) => add(UpdateProduct(product)));
  }

  Stream<ProductState> _mapUpdateProductToState(UpdateProduct event) async* {
    yield ProductLoaded(products: event.product);
  }
}

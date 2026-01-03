import 'package:flutter/foundation.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<String> _favoriteProductIds = [];

  List<String> get favoriteProductIds => [..._favoriteProductIds];

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  void toggleFavorite(String productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }
    notifyListeners();
  }

  List<Product> getFavoriteProducts(List<Product> allProducts) {
    return allProducts
        .where((product) => _favoriteProductIds.contains(product.id))
        .toList();
  }

  int get favoriteCount => _favoriteProductIds.length;
}

import 'package:flutter/material.dart';
import 'package:erevive/src/model/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:erevive/src/model/product_category.dart';
import 'package:erevive/src/model/product_size_type.dart';
import 'package:erevive/src/model/recommended_product.dart';
import 'package:erevive/src/model/bottom_navy_bar_item.dart';

class AppData {
  const AppData._();

  static const String dummyText =
      'Buying e-waste is both eco-friendly and budget-friendly for customers, offering a cost-effective way to repurpose electronics while reducing landfill waste.';

  static List<Product> products = [
    Product(
      name: 'Phone',
      price: 800,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/phone6.png',
        'assets/images/phone5.png',
        'assets/images/phone8.png',
      ],
      isFavorite: true,
      rating: 1,
      type: ProductType.mobile,
    ),
    Product(
      name: 'Keyboard',
      price: 380,
      isAvailable: false,
      off: null,
      quantity: 0,
      images: [
        'assets/images/key3.png',
        'assets/images/key4.png',
        'assets/images/key5.png',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.keyboard,
    ),
    Product(
      name: 'keyboard',
      price: 350,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/key1.png',
        'assets/images/keyboard.png',
        'assets/images/key2.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.keyboard,
    ),
    Product(
      name: 'remote car',
      price: 300,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/toy2.png',
        'assets/images/toy3.png',
        'assets/images/toy4.png',
      ],
      isFavorite: false,
      rating: 5,
      sizes: ProductSizeType(),
      type: ProductType.toys,
    ),
    Product(
      name: 'remote jeep',
      price: 330,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/toy6.png',
        'assets/images/toy8.png',
        'assets/images/toy5.png',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.toys,
    ),
    Product(
      name: 'brocken headset',
      price: 230,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/headphone1.png',
        'assets/images/headphone2.png',
        'assets/images/headphone3.png',
        'assets/images/headphone2.png',
      ],
      isFavorite: false,
      rating: 2,
      type: ProductType.headphone,
    ),
    Product(
      name: 'Tv',
      price: 450,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/tv11.png',
        'assets/images/tv12.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.tv,
    ),
    Product(
      name: 'Tv',
      price: 560,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/tv4.jpeg',
        'assets/images/tv15.png',
      ],
      isFavorite: false,
      rating: 2,
      type: ProductType.tv,
    ),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(
      type: ProductType.all,
      icon: Icons.all_inclusive,
    ),
    ProductCategory(
      type: ProductType.mobile,
      icon: FontAwesomeIcons.mobileScreenButton,
    ),
    ProductCategory(
      type: ProductType.toys,
      icon: Icons.toys,
    ),
    ProductCategory(
      type: ProductType.keyboard,
      icon: FontAwesomeIcons.keyboard,
    ),
    ProductCategory(
      type: ProductType.headphone,
      icon: Icons.headphones,
    ),
    ProductCategory(
      type: ProductType.tv,
      icon: Icons.tv,
    ),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    const BottomNavyBarItem(
      "BUY",
      Icon(Icons.home),
      Color(0xFFEC6813),
    ),
    const BottomNavyBarItem(
      "Favorite",
      Icon(Icons.favorite),
      Color(0xFFEC6813),
    ),
    const BottomNavyBarItem(
      "SELL",
      Icon(Icons.add_circle_outline),
      Color(0xFFEC6813),
    ),
    const BottomNavyBarItem(
      "Cart",
      Icon(Icons.shopping_cart),
      Color(0xFFEC6813),
    ),
    // New bottom navigation bar item for "Coin"
    const BottomNavyBarItem(
      "Profile",
      Icon(Icons.person),
      Color(0xFFEC6813),
    ),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
      imagePath: "",
      cardBackgroundColor: const Color(0xFFEC6813),
    ),
    RecommendedProduct(
      imagePath: "",
      cardBackgroundColor: const Color(0xFF3081E1),
      buttonBackgroundColor: const Color(0xFF9C46FF),
      buttonTextColor: const Color.fromARGB(255, 92, 32, 32),
    ),
  ];
}

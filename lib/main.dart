import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Clothing App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Црвен Фустан',
      'image': 'assets/red_dress.jpg',
      'description': 'Прекрасен црвен фустан погоден за секаква прилика.',
      'price': '2990 ден.',
    },
    {
      'name': 'Фармерки',
      'image': 'assets/blue_jeans.jpg',
      'description': 'Фармерки за секојдневна удобност.',
      'price': '1990 ден.',
    },
    {
      'name': 'Кожна Јакна',
      'image': 'assets/leather_jacket.jpg',
      'description': 'Модерна кожна јакна изработена од имитација на кожа.',
      'price': '4290 ден.',
    },
  ];

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('213134'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(1),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      product['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    product['price']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Image.asset(
              product['image']!,
              height: 600,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 36),
            Text(
              product['name']!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 36),
            Text(
              product['description']!,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 36),
            Text(
              product['price']!,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}








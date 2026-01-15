import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// data

class Product {
  final String name;
  final double price;
  final String image;
  final String category;

  Product(this.name, this.price, this.image, this.category);
}

final List<Product> products = [
  Product("Fresh Avocado", 4.0,
      "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=500",
      "Fruits"),
  Product("Red Tomatoes", 2.5,
      "https://cdn.mos.cms.futurecdn.net/WaZM7X6HxT5pEZQThL9TLE.jpg",
      "Vegetables"),
  Product("Organic Bananas", 1.2,
      "https://images.unsplash.com/photo-1603833665858-e61d17a86224?w=500",
      "Fruits"),
  Product("Crunchy Snacks", 5.0,
      "https://foodal.com/wp-content/uploads/2020/04/The-Best-Variety-of-Pantry-Snacks.jpg",
      "Snacks"),
];

final List<String> categories = [
  "All",
  "Fruits",
  "Vegetables",
  "Snacks"
];

// Home page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryIndex = 0;
  int cartCount = 0;

  List<Product> get filteredProducts {
    if (categories[selectedCategoryIndex] == "All") {
      return products;
    }
    return products
        .where((p) => p.category == categories[selectedCategoryIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("FreshCart",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              if (cartCount > 0)
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                )
            ],
          ),
        ],
      ),

      // categories
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BannerSlider()),
          SliverToBoxAdapter(
              child: SectionTitle(title: "Categories")),
          SliverToBoxAdapter(
            child: CategoryList(
              selectedIndex: selectedCategoryIndex,
              onSelected: (index) {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
              child: SectionTitle(title: "Products")),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(
                    product: filteredProducts[index],
                    onAdd: () {
                      setState(() {
                        cartCount++;
                      });
                    },
                  );
                },
                childCount: filteredProducts.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ui

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [Colors.green.shade400, Colors.green.shade700]),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("30% OFF", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  Text("On your first order", style: TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
            ),
          ),
          Image.network("https://cdn-icons-png.flaticon.com/512/2331/2331970.png", height: 100), // Mock basket icon
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelected;

  const CategoryList(
      {super.key, required this.selectedIndex, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductCard(
      {super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailPage(product: product),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                        child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${product.price}",
                          style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Colors.green),
                        onPressed: onAdd,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// detail page

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.image, height: 250),
            const SizedBox(height: 20),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("\$${product.price}",
                style:
                    const TextStyle(fontSize: 20, color: Colors.green)),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "This is a placeholder product detail page.",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// title

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Routing',
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute, // Use RouteGenerator for routing
  ));
}

// Define the RouteGenerator class
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
      case '/detail':
        final args = settings.arguments as Map; // Expecting a Map
        return MaterialPageRoute(
          builder: (_) => DetailPage(
            npm: args['npm'], // Extract npm
            nama: args['nama'], // Extract nama
          ),
        );
      default:
        return _errorRoute(); // Handle unknown routes
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error: Route not found')),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('Layar Utama'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: {
                    'npm': 2210631170116, // Pass npm
                    'nama': "Dinda Ismi Hanifah Waskito", // Pass nama
                  },
                );
              },
              child: Text('Go to Detail Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }
}

// Define the DetailPage
class DetailPage extends StatelessWidget {
  final int npm;
  final String nama;

  DetailPage({required this.npm, required this.nama}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NPM: $npm'),
            Text('Nama: $nama'),
          ],
        ),
      ),
    );
  }
}

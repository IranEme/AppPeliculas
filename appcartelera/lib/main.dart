import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cinepolis',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(128, 0, 0, 0),
                ),
              ],
            ),
          ),
          leading: const Icon(Icons.tv),
          backgroundColor: const Color.fromARGB(255, 42, 57, 102),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              seccionPeliculas('Nuevas películas', [
                peliculaCard(
                  "https://static.cinepolis.com/img/peliculas/48253/1/1/48253.jpg",
                  "Sonic 3",
                  4.5,
                ),
                peliculaCard(
                  "https://static.cinepolis.com/img/peliculas/48823/1/1/48823.jpg",
                  "Guardianes de la Galaxia",
                  4.0,
                ),
                peliculaCard(
                  "https://static.cinepolis.com/img/peliculas/48411/1/1/48411.jpg",
                  "Doctor Strange",
                  5.0,
                ),
              ]),
              const Divider(thickness: 2),
              seccionPeliculas('Películas viejas', [
                peliculaCard(
                  "https://static.cinepolis.com/img/peliculas/46983/1/1/46983.jpg",
                  "Titanic",
                  4.8,
                ),
                peliculaCard(
                  "https://static.cinepolis.com/img/peliculas/46000/1/1/46000.jpg",
                  "Volver al Futuro",
                  5.0,
                ),
                peliculaCard(
                  "https://static.cinepolis.com/img/peliculas/45000/1/1/45000.jpg",
                  "El Padrino",
                  5.0,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget seccionPeliculas(String titulo, List<Widget> peliculas) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 400,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: peliculas,
          ),
        ),
      ],
    );
  }

  Widget peliculaCard(String imageUrl, String movieName, double rating) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 200,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        Text(
          movieName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.yellow[700],
              size: 20,
            );
          }),
        ),  
      ],
    );
  }
}

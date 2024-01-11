// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:lta_flutter_application_01/extensions/size_extensions.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            options: CarouselOptions(
              height: context.percentHeight(.40),
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            itemBuilder: (context, index, realIndex) {
              return FutureBuilder<Uint8List>(
                future: loadImage(
                    'assets/images/carousel/carousel${index + 1}.jpg'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      width: context.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              );
            },
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }

  Future<Uint8List> loadImage(String imagePath) async {
    // Substitua este bloco pela lógica real de carregamento da imagem
    // Exemplo: Pode usar pacotes como 'cached_network_image' ou 'flutter_advanced_networkimage'
    // Certifique-se de otimizar as imagens conforme necessário.
    ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }
}

//Componentes
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

//Telas
import '../../../constants/constants.dart';
import '../../layout/myHeader.dart';

class scrnHome extends StatelessWidget {
  final String apiKey =
      '309e8cbafc4d064fb96d64c70507d5ab'; // Sua chave de API OpenWeatherMap

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            //Header
            Header(),
            SizedBox(height: defaultPadding),
            //body
            Row(
              children: [
                Expanded(
                  flex: 70,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    height: 500,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  flex: 29,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    height: 500,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Alinha à esquerda
                        children: [
                          SizedBox(
                            child: Text(
                              'Clima tempo',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          FutureBuilder<WeatherCurrent>(
                            future: _fetchWeather(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text(
                                    'Erro ao obter dados meteorológicos');
                              } else if (snapshot.hasData) {
                                WeatherCurrent weatherData = snapshot.data!;

                                String descricaoClima =
                                    weatherData.weatherDescription as String;
                                String iconeClima =
                                    weatherData.weatherIcon as String;

                                String urlIcone =
                                    'https://openweathermap.org/img/wn/$iconeClima@2x.png';

                                double? temperatura =
                                    (weatherData.tempFeelsLike)! / 10;
                                double tempArred = double.parse(
                                    temperatura.toStringAsFixed(2));

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      urlIcone,
                                      scale: 2,
                                    ),
                                    Text(
                                      'Clima: $descricaoClima\n'
                                      'Temperatura: $tempArred°C',
                                      style: TextStyle(fontSize: h5Text),
                                    ),
                                  ],
                                );
                              }
                              return Text('Nenhum dado disponível');
                            },
                          ),
                          Divider(color: dividerColor),
                          SizedBox(
                            child: Text(
                              'Mobilidade',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          FutureBuilder<List<Map<String, String>>>(
                            future: getStatusViaMobilidade(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text(
                                    'Erro ao obter dados de mobilidade');
                              } else if (snapshot.hasData) {
                                List<Map<String, String>> linhas =
                                    snapshot.data!;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: linhas.map((linha) {
                                    String status = linha['status'] ?? '';
                                    bool isOperacaoNormal =
                                        status.toLowerCase() ==
                                            'operação normal';
                                    return ListTile(
                                      title: Text(
                                        'Linha ${linha['numero']} - ${linha['status']}',
                                        style: TextStyle(
                                          color: isOperacaoNormal
                                              ? fontColor
                                              : Colors.amber,
                                          fontSize:
                                              16.0, // Ajuste o tamanho da fonte conforme necessário
                                        ),
                                      ),
                                      // Outros atributos do ListTile conforme necessário
                                    );
                                  }).toList(),
                                );
                              }
                              return Text('Nenhum dado disponível');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função para obter dados meteorológicos usando a API do OpenWeatherMap
  Future<WeatherCurrent> _fetchWeather() async {
    const lang = WeatherLanguage.portugueseBrazilian;
    final wService = WeatherService(apiKey, language: lang);
    return await wService.currentWeatherByLocation(
        latitude: -23.554472, longitude: -46.444024);
  }

  Future<List<Map<String, String>>> getStatusViaMobilidade() async {
    List<Map<String, String>> linhas = [];

    try {
      final uri = Uri.parse('https://www.viamobilidade.com.br/');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var document = html.parse(response.body);

        // Encontrar o grupo de linhas
        var linhasGroup = document.querySelector('.line-wrapper');

        // Verificar se o grupo de linhas foi encontrado
        if (linhasGroup != null) {
          // Encontrar todas as li dentro do grupo
          var linhasHTML = linhasGroup.querySelectorAll('li');

          // Iterar sobre as linhas
          for (var linhaHTML in linhasHTML) {
            // Encontrar os elementos dentro da li
            var numero = linhaHTML.querySelector('span')?.text.trim();
            var status = linhaHTML.querySelector('.status')?.text.trim();

            // Adicionar os detalhes da linha à lista
            linhas.add({'numero': numero ?? '', 'status': status ?? ''});
          }
        } else {
          print('Grupo de linhas não encontrado');
        }
      } else {
        print(
            'Falha ao carregar a página da Via Mobilidade. Código de status: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao obter status da Via Mobilidade: $e');
    }

    return linhas;
  }
}

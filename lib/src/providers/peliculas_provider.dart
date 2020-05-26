
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {

  String _apikey    = '8f6f7b0fb09c1657260bd420e3c8a777';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{    
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async{

    final url = Uri.https(_url,'3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language,
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async{

    Uri url = Uri.https(_url,'3/movie/popular',{
      'api_key' : _apikey,
      'language': _language,
    });

    return await _procesarRespuesta(url);
  }


  
}
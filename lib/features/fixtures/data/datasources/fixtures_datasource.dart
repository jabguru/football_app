import 'package:dio/dio.dart';
import 'package:football_app/constants/secret_keys.dart';
import 'package:football_app/core/error/exceptions.dart';
import 'package:football_app/core/services/url_service.dart';
import 'package:football_app/features/fixtures/data/models/fixture.dart';
import 'package:intl/intl.dart';

abstract class FixturesDatasource {
  Future<List<FixtureModel>> getFixtures();
}

class FixturesDatasourceImpl implements FixturesDatasource {
  final Dio dio;
  FixturesDatasourceImpl({
    required this.dio,
  });
  @override
  Future<List<FixtureModel>> getFixtures() async {
    final Response res = await dio.get(
      UrlService.fixtures,
      queryParameters: {
        'timezone': "Africa/Lagos",
        'date': DateFormat('y-MM-d').format(DateTime.now()),
      },
      options: Options(headers: {'x-apisports-key': kFootballApiKey}),
    );

    if (res.statusCode == 200) {
      List data = res.data['response'];
      return data.map((e) => FixtureModel.fromMap(e)).toList();
    }

    throw ServerException();
  }
}

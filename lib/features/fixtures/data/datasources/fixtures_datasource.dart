import 'package:dio/dio.dart';
import 'package:football_app/constants/secret_keys.dart';
import 'package:football_app/core/error/exceptions.dart';
import 'package:football_app/core/services/url_service.dart';
import 'package:football_app/features/fixtures/data/models/fixture.dart';
import 'package:football_app/features/fixtures/data/models/statistics.dart';
import 'package:intl/intl.dart';

abstract class FixturesDatasource {
  Future<List<FixtureModel>> getFixtures();
  Future<StatisticsModel?> getStatistics(int fixtureId);
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
        // ? THIS TIMEZONE PARAM IS NOT WORKING, IT DOESN'T HAVE IMPACT
        'timezone': "Africa/Lagos",
        'date': DateFormat('y-MM-dd').format(DateTime.now()),
      },
      options: Options(headers: {'x-apisports-key': kFootballApiKey}),
    );

    if (res.statusCode == 200) {
      List data = res.data['response'];
      return data.map((e) => FixtureModel.fromMap(e)).toList();
    }

    throw ServerException();
  }

  @override
  Future<StatisticsModel?> getStatistics(int fixtureId) async {
    final Response res = await dio.get(
      UrlService.statistics,
      queryParameters: {
        'fixture': fixtureId,
      },
      options: Options(headers: {'x-apisports-key': kFootballApiKey}),
    );

    if (res.statusCode == 200) {
      List data = res.data['response'];
      if (data.isNotEmpty) {
        return StatisticsModel(
          team1: TeamStatisticsModel.fromMap(data[0]),
          team2: TeamStatisticsModel.fromMap(data[1]),
        );
      }
      return null;
    }

    throw ServerException();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location2_retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'api.openweathermap.org/geo/1.0';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Location2> getCoordinates(cityName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'&q': cityName};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Location2>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/direct?limit=1&appid=f96dba3b75e7751664320b04d829142b',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Location2.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

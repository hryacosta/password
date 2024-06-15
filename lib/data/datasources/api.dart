abstract class Api {
  const Api(this.host, this.stage, this.scheme);

  final String host;
  final String stage;
  final String scheme;

  Uri baseUrl() {
    return Uri(
      scheme: scheme,
      host: host,
    );
  }
}

// ignore: constant_identifier_names
enum Env { PRODUCTION, QAS, DEV, LOCAL }

class ConfigEnvironments {
  static const Env _currentEnvironments = Env.LOCAL;

  static final List<Environment> _availableEnvironments = [
    const Environment(
      env: Env.LOCAL,
      url: 'http://localhost:8080/api/',
      imageBaseUrl: 'http://localhost:8080/',
    ),
    const Environment(
      env: Env.DEV,
      url: '',
      imageBaseUrl: 'http://localhost:8080/',
    ),
    const Environment(
      env: Env.QAS,
      url: '',
      imageBaseUrl: 'http://localhost:8080/',
    ),
    const Environment(
      env: Env.PRODUCTION,
      url: '',
      imageBaseUrl: 'http://localhost:8080/',
    ),
  ];

  static Environment getEnvironment() {
    return _availableEnvironments.firstWhere(
      (d) => d.env == _currentEnvironments,
    );
  }
}

class Environment {
  final Env env;
  final String url;
  final String imageBaseUrl;

  const Environment({
    required this.env,
    required this.url,
    required this.imageBaseUrl,
  });
}

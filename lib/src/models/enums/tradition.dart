enum Tradition {
  universal,
  classical,
  psychological,
  eventOriented('event_oriented'),
  vedic,
  chinese;

  final String? _value;
  const Tradition([this._value]);

  String get value => _value ?? name;
}

enum ReportTradition {
  universal,
  psychological,
  eventOriented('event_oriented'),
  classical;

  final String? _value;
  const ReportTradition([this._value]);

  String get value => _value ?? name;
}

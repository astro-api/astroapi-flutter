class DateTimeLocation {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int? second;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? countryCode;
  final String? timezone;

  const DateTimeLocation({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    this.second,
    this.latitude,
    this.longitude,
    this.city,
    this.countryCode,
    this.timezone,
  });

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'day': day,
        'hour': hour,
        'minute': minute,
        if (second != null) 'second': second,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (city != null) 'city': city,
        if (countryCode != null) 'country_code': countryCode,
        if (timezone != null) 'timezone': timezone,
      };
}

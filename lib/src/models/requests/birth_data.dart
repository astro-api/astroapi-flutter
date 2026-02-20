class BirthData {
  final int year;
  final int? month;
  final int? day;
  final int? hour;
  final int? minute;
  final int? second;
  final String? city;
  final String? countryCode;
  final double? latitude;
  final double? longitude;
  final String? timezone;

  const BirthData({
    required this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.city,
    this.countryCode,
    this.latitude,
    this.longitude,
    this.timezone,
  });

  Map<String, dynamic> toJson() => {
        'year': year,
        if (month != null) 'month': month,
        if (day != null) 'day': day,
        if (hour != null) 'hour': hour,
        if (minute != null) 'minute': minute,
        if (second != null) 'second': second,
        if (city != null) 'city': city,
        if (countryCode != null) 'country_code': countryCode,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (timezone != null) 'timezone': timezone,
      };
}

import '../enums/house_system.dart';
import '../enums/perspective_type.dart';
import '../enums/zodiac_type.dart';
import 'fixed_stars_config.dart';

class ChartOptions {
  final HouseSystem? houseSystem;
  final ZodiacType? zodiacType;
  final List<String>? activePoints;
  final double? precision;
  final int? returnYear;
  final String? returnDate;
  final String? targetDate;
  final PerspectiveType? perspective;
  final FixedStarsConfig? fixedStars;

  const ChartOptions({
    this.houseSystem,
    this.zodiacType,
    this.activePoints,
    this.precision,
    this.returnYear,
    this.returnDate,
    this.targetDate,
    this.perspective,
    this.fixedStars,
  });

  Map<String, dynamic> toJson() => {
        if (houseSystem != null) 'house_system': houseSystem!.value,
        if (zodiacType != null) 'zodiac_type': zodiacType!.value,
        if (activePoints != null) 'active_points': activePoints,
        if (precision != null) 'precision': precision,
        if (returnYear != null) 'return_year': returnYear,
        if (returnDate != null) 'return_date': returnDate,
        if (targetDate != null) 'target_date': targetDate,
        if (perspective != null) 'perspective': perspective!.value,
        if (fixedStars != null) 'fixed_stars': fixedStars!.toJson(),
      };
}

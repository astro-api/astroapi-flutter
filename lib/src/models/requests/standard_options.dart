import '../enums/house_system.dart';
import '../enums/language.dart';
import '../enums/perspective_type.dart';
import '../enums/tradition.dart';
import '../enums/zodiac_type.dart';

class StandardOptions {
  final HouseSystem? houseSystem;
  final Language? language;
  final Tradition? tradition;
  final ZodiacType? zodiacType;
  final List<String>? activePoints;
  final double? precision;
  final PerspectiveType? perspective;

  const StandardOptions({
    this.houseSystem,
    this.language,
    this.tradition,
    this.zodiacType,
    this.activePoints,
    this.precision,
    this.perspective,
  });

  Map<String, dynamic> toJson() => {
        if (houseSystem != null) 'house_system': houseSystem!.value,
        if (language != null) 'language': language!.value,
        if (tradition != null) 'tradition': tradition!.value,
        if (zodiacType != null) 'zodiac_type': zodiacType!.value,
        if (activePoints != null) 'active_points': activePoints,
        if (precision != null) 'precision': precision,
        if (perspective != null) 'perspective': perspective!.value,
      };
}

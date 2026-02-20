import '../enums/detail_level.dart';
import '../enums/house_system.dart';
import '../enums/language.dart';
import '../enums/perspective_type.dart';
import '../enums/tradition.dart';
import '../enums/zodiac_type.dart';

class DataOptions {
  final HouseSystem? houseSystem;
  final Language? language;
  final Tradition? tradition;
  final PerspectiveType? perspective;
  final DetailLevel? detailLevel;
  final bool? includeInterpretations;
  final bool? includeRawData;
  final bool? useCache;
  final bool? precisionMode;
  final ZodiacType? zodiacType;
  final List<String>? activePoints;
  final double? precision;

  const DataOptions({
    this.houseSystem,
    this.language,
    this.tradition,
    this.perspective,
    this.detailLevel,
    this.includeInterpretations,
    this.includeRawData,
    this.useCache,
    this.precisionMode,
    this.zodiacType,
    this.activePoints,
    this.precision,
  });

  Map<String, dynamic> toJson() => {
        if (houseSystem != null) 'house_system': houseSystem!.value,
        if (language != null) 'language': language!.value,
        if (tradition != null) 'tradition': tradition!.value,
        if (perspective != null) 'perspective': perspective!.value,
        if (detailLevel != null) 'detail_level': detailLevel!.value,
        if (includeInterpretations != null)
          'include_interpretations': includeInterpretations,
        if (includeRawData != null) 'include_raw_data': includeRawData,
        if (useCache != null) 'use_cache': useCache,
        if (precisionMode != null) 'precision_mode': precisionMode,
        if (zodiacType != null) 'zodiac_type': zodiacType!.value,
        if (activePoints != null) 'active_points': activePoints,
        if (precision != null) 'precision': precision,
      };
}

enum FixedStarPresetName {
  essential,
  traditional,
  behenian,
  extended;

  String get value => name;
}

class FixedStarsConfig {
  final List<FixedStarPresetName>? presets;
  final Map<String, double>? customOrbs;
  final bool? includeParans;
  final bool? includeHeliacal;
  final bool? includeInterpretations;

  const FixedStarsConfig({
    this.presets,
    this.customOrbs,
    this.includeParans,
    this.includeHeliacal,
    this.includeInterpretations,
  });

  Map<String, dynamic> toJson() => {
        if (presets != null) 'presets': presets!.map((p) => p.value).toList(),
        if (customOrbs != null) 'custom_orbs': customOrbs,
        if (includeParans != null) 'include_parans': includeParans,
        if (includeHeliacal != null) 'include_heliacal': includeHeliacal,
        if (includeInterpretations != null)
          'include_interpretations': includeInterpretations,
      };
}

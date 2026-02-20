import '../enums/language.dart';
import '../enums/tradition.dart';

class ReportOptions {
  final ReportTradition? tradition;
  final Language? language;

  const ReportOptions({
    this.tradition,
    this.language,
  });

  Map<String, dynamic> toJson() => {
        if (tradition != null) 'tradition': tradition!.value,
        if (language != null) 'language': language!.value,
      };
}

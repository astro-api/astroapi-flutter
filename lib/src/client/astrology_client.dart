import '../categories/analysis_client.dart';
import '../categories/astrocartography_client.dart';
import '../categories/charts_client.dart';
import '../categories/chinese_client.dart';
import '../categories/data_client.dart';
import '../categories/eclipses_client.dart';
import '../categories/enhanced_client.dart';
import '../categories/fixed_stars_client.dart';
import '../categories/glossary_client.dart';
import '../categories/horoscope_client.dart';
import '../categories/insights_client.dart';
import '../categories/lunar_client.dart';
import '../categories/numerology_client.dart';
import '../categories/svg_client.dart';
import '../categories/tarot_client.dart';
import '../categories/traditional_client.dart';
import '../config/astrology_client_config.dart';
import '../http/dio_http_client.dart';

class AstrologyClient {
  late final DataClient data;
  late final ChartsClient charts;
  late final HoroscopeClient horoscope;
  late final AnalysisClient analysis;
  late final GlossaryClient glossary;
  late final AstrocartographyClient astrocartography;
  late final ChineseClient chinese;
  late final EclipsesClient eclipses;
  late final LunarClient lunar;
  late final NumerologyClient numerology;
  late final TarotClient tarot;
  late final TraditionalClient traditional;
  late final FixedStarsClient fixedStars;
  late final InsightsClient insights;
  late final SvgClient svg;
  late final EnhancedClient enhanced;

  AstrologyClient(AstrologyClientConfig config) {
    final httpHelper = DioHttpClient(config);
    data = DataClient(httpHelper);
    charts = ChartsClient(httpHelper);
    horoscope = HoroscopeClient(httpHelper);
    analysis = AnalysisClient(httpHelper);
    glossary = GlossaryClient(httpHelper);
    astrocartography = AstrocartographyClient(httpHelper);
    chinese = ChineseClient(httpHelper);
    eclipses = EclipsesClient(httpHelper);
    lunar = LunarClient(httpHelper);
    numerology = NumerologyClient(httpHelper);
    tarot = TarotClient(httpHelper);
    traditional = TraditionalClient(httpHelper);
    fixedStars = FixedStarsClient(httpHelper);
    insights = InsightsClient(httpHelper);
    svg = SvgClient(httpHelper);
    enhanced = EnhancedClient(httpHelper);
  }
}

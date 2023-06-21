part of '../home_page.dart';

class AppbarHeader extends StatelessWidget {
  final WeatherCondition weather;
  final Color color;

  const AppbarHeader({
    super.key,
    required this.weather,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  weather.background,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${weather.main.temp.toInt()}°',
                      style: context.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weather.weather.first.main.toUpperCase(),
                      style: context.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const GeoInfoText(),
                  ],
                ),
              ),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LikeButton(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ColoredBox(
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(' ${weather.main.temp_min.toInt()}°\nmin'),
                ),
                Expanded(
                  child: Text(
                    '${weather.main.temp.toInt()}°\nCurrrent',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${weather.main.temp_max.toInt()}°\nmax',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}

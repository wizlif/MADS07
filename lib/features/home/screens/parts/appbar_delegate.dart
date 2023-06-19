part of '../home_page.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Color secondaryColor;
  final WeatherForecast forecast;

  AppBarDelegate({
    required this.expandedHeight,
    required this.secondaryColor,
    required this.forecast,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        ColoredBox(color: forecast.color),
        if (shrinkOffset < 100) ...[
          _HeaderContent(
            forecast: forecast,
            color: secondaryColor,
          ),
        ] else
          AppBar(
            elevation: 0,
            backgroundColor: forecast.color,
          ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight + kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _HeaderContent extends StatelessWidget {
  final WeatherForecast forecast;
  final Color color;

  const _HeaderContent({
    required this.forecast,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${forecast.main.temp.toInt()}°',
                      style: context.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      forecast.weather.first.main.toUpperCase(),
                      style: context.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      forecast.animatedIcon,
                      width: context.screenWidth / 3,
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
                  child: Text(' ${forecast.main.temp_min.toInt()}°\nmin'),
                ),
                Expanded(
                  child: Text(
                    '${forecast.main.temp.toInt()}°\nCurrrent',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${forecast.main.temp_max.toInt()}°\nmax',
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

part of '../home_page.dart';

class ForecastsList extends StatelessWidget {
  final List<List<WeatherForecast>> forecasts;

  const ForecastsList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: forecasts.length - 1,
        (context, index) {
          final forecast = forecasts[index + 1].first;
          return ForecastTile(forecast: forecast);
        },
      ),
    );
  }
}

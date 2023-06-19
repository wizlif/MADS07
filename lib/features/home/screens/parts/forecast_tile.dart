part of '../home_page.dart';

class ForecastTile extends StatelessWidget {
  final WeatherForecast forecast;

  const ForecastTile({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(forecast.dayOfWeek),
          ),
          Expanded(
            child: Icon(
              forecast.icon,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${forecast.main.temp_max.toInt()}°',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

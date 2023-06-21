part of '../home_page.dart';

class WeatherForecastsList extends ConsumerWidget {
  const WeatherForecastsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeatherSync = ref.watch(weatherControllerProvider);

    return currentWeatherSync.when(
      data: (weatherCondition) {
        return Scaffold(
          backgroundColor: weatherCondition.color,
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: AppBarDelegate(
                  expandedHeight: 357,
                  secondaryColor: weatherCondition.color,
                ),
                pinned: true,
              ),
              const ForecastsList(),
            ],
          ),
        );
      },
      error: (error, stack) {
        return Center(
          child: Text(
            error.toString(),
            style: TextStyle(
              color: context.primary,
            ),
          ),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

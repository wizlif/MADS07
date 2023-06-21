part of '../home_page.dart';

class ForecastsList extends ConsumerWidget {
  const ForecastsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastsSync = ref.watch(forecastControllerProvider);

    return forecastsSync.when(
      data: (forecasts) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: forecasts.length - 1,
            (context, index) {
              final forecast = forecasts[index + 1].first;
              return ForecastTile(forecast: forecast);
            },
          ),
        );
      },
      error: (error, stack) {
        return SliverToBoxAdapter(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

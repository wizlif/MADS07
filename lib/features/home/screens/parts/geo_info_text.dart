part of '../home_page.dart';

class GeoInfoText extends ConsumerWidget {
  const GeoInfoText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geoInfoSync = ref.watch(geoInfoControllerProvider);

    return geoInfoSync.maybeWhen(
      data: (info) => Text(info.name),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

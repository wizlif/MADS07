import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nssf_interview/core/controllers/color.controller.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';

class FavoritesMapPage extends StatefulWidget {
  final List<GeoInfo> favorites;
  const FavoritesMapPage({super.key, required this.favorites});

  @override
  State<FavoritesMapPage> createState() => _FavoritesMapPageState();
}

class _FavoritesMapPageState extends State<FavoritesMapPage> {
  GoogleMapController? _controller;
  late LatLng initialLocation;
  final _markers = ValueNotifier(<Marker>[]);

  @override
  void initState() {
    super.initState();
    final baseFavorite = widget.favorites.first;
    initialLocation = LatLng(baseFavorite.lat, baseFavorite.lon);
    MarkerIcon.markerFromIcon(
      CupertinoIcons.cloud_bolt_fill,
      const Color(0xFFA83DA3),
      100,
    ).then((icon) {
      final m = <Marker>[];
      for (final fav in widget.favorites) {
        m.add(
          Marker(
            markerId: MarkerId(fav.key),
            position: LatLng(fav.lat, fav.lon),
            icon: icon,
            infoWindow: InfoWindow(title: fav.name),
          ),
        );
      }

      _markers.value = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<List<Marker>>(
            valueListenable: _markers,
            builder: (_, markers, __) {
              return GoogleMap(
                buildingsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: initialLocation,
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) async {
                  _controller = controller;

                  for (final marker in markers) {
                    _controller?.showMarkerInfoWindow(marker.markerId);
                  }
                },
                markers: Set.from(markers),
              );
            },
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final color = ref.watch(colorControllerProvider);
                    return MaterialButton(
                      onPressed: () => Navigator.of(context).pop(),
                      shape: const CircleBorder(),
                      color: color,
                      padding: const EdgeInsets.all(10),
                      child: const Icon(CupertinoIcons.left_chevron),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

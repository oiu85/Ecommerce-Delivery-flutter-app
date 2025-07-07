import 'dart:convert';
import 'package:delivery/core/constant/color.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

// متغيرات عامة للاستخدام في الكونترولر
Set<Polyline> polylineSet2 = {};
double? routeDistance; // بالميتر
double? routeDuration; // بالثانية

Future<void> getPolyLineWithOSRM(double startLat, double startLng, double endLat, double endLng) async {
  List<LatLng> polylineco = [];
  try {
    polylineco.clear();
    polylineSet2.clear();

    final url = "http://router.project-osrm.org/route/v1/driving/$startLng,$startLat;$endLng,$endLat?overview=full&geometries=geojson";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData['routes'].isNotEmpty) {
        final route = jsonData['routes'][0];
        final coords = route['geometry']['coordinates'];

        routeDistance = (route['distance'] as num).toDouble();
        routeDuration = (route['duration'] as num).toDouble() + 600; // إضافة 10 دقائق تقديرية

        for (var coord in coords) {
          double lon = coord[0];
          double lat = coord[1];
          polylineco.add(LatLng(lat, lon));
        }

        final polyline = Polyline(
          polylineId: PolylineId("route_osrm"),
          color: AppColor.red,
          width: 5,
          points: polylineco,
        );

        polylineSet2.add(polyline);
      } else {
        print("❌ No routes found from OSRM.");
      }
    } else {
      print("❌ Failed to fetch route. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("❌ Error fetching route: $e");
  }
}

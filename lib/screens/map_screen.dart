import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _Map_ScreenState createState() => _Map_ScreenState();
}

class _Map_ScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(29.712254, 95.791260);
  final Set<Marker> _markers = {};
  LatLng _lastMP = _center;
  MapType _currentMapType = MapType.normal;
  double zoomVal = 5.0;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(29.712254, 95.791260),
    tilt: 59.440,
    zoom: 11,
  );

  Future<void> _goToPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.minimize, color: Color(0xff6200ee)),
        onPressed: () {
          zoomVal--;
          _minus(zoomVal);
        },
      ),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(Icons.add, color: Color(0xff6200ee)),
        onPressed: () {
          zoomVal++;
          _plus(zoomVal);
        },
      ),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(37.688208, 121.870667), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(37.688208, 121.870667), zoom: zoomVal)));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMP = position.target;
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.green,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMP.toString()),
          position: _lastMP,
          infoWindow: InfoWindow(
            title: 'Plant Request',
            snippet: 'Please accept or decline',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places to Garden'),
        backgroundColor: Colors.green[600],
      ),
      body: Stack(
        children: <Widget>[
          _zoomminusfunction(),
          _zoomplusfunction(),
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            zoomGesturesEnabled: true,
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  button(_onMapTypeButtonPressed, Icons.map),
                  SizedBox(height: 16.0),
                  button(_onAddMarkerButtonPressed, Icons.add_location),
                  SizedBox(
                    height: 16.0,
                  ),
                  button(_goToPosition, Icons.location_searching),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://i.ytimg.com/vi/DcmigBHpClI/maxresdefault.jpg',
                  37.691314,
                  -121.884594,
                  "Creekside Park"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://i.pinimg.com/originals/ee/44/87/ee44875e090cf05fa307d5387fb77d3f.jpg',
                  29.713304,
                  95.747995,
                  "Katy Park Garden"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://extension.umd.edu/sites/extension.umd.edu/files/resize/_images/locations/cecil_county/communitygarden-498x374.jpg',
                  29.782035,
                  -95.689510,
                  "Pleasanton Park Garden"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String gardenName) {
    return GestureDetector(
      onTap: () {
        _goToPosition();
      },
      child: Container(
        child: new FittedBox(
          child: Material(
            color: Colors.green,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer(gardenName),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String gardenName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              gardenName,
              style: TextStyle(
                  color: Color(165), fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text('Accept the Planting request?'),
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:planets/constants.dart';

void main() {
  runApp(const PlanetsApp());
}

class PlanetsApp extends StatefulWidget {
  const PlanetsApp({super.key});

  @override
  State<PlanetsApp> createState() => _PlanetsAppState();
}

class _PlanetsAppState extends State<PlanetsApp> {
  int _currentPlanet = 0;
  Flutter3DController controller = Flutter3DController();

  final List<String> planetModels = [
    'assets/mercury.glb',
    'assets/venus.glb',
    'assets/earth.glb',
    'assets/mars.glb',
    'assets/jupiter.glb',
    'assets/saturn.glb',
    'assets/uranus.glb',
    'assets/neptune.glb',
    'assets/pluto.glb'
  ];

  // Cache for preloading
  Map<int, Flutter3DController> modelCache = {};

  @override
  void initState() {
    super.initState();
    _preloadModels();
  }

  void _preloadModels() {
    // Load the current, next, and previous planet models into the cache
    modelCache[_currentPlanet] = Flutter3DController();
    if (_currentPlanet > 0) {
      modelCache[_currentPlanet - 1] = Flutter3DController();
    }
    if (_currentPlanet < planetModels.length - 1) {
      modelCache[_currentPlanet + 1] = Flutter3DController();
    }
  }

  void _nextPlanet() {
    if (_currentPlanet == planetModels.length - 1) return;
    setState(() {
      _currentPlanet++;
      _preloadModels();
    });
  }

  void _prevPlanet() {
    if (_currentPlanet == 0) return;
    setState(() {
      _currentPlanet--;
      _preloadModels();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Our Solar System',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: _currentPlanet == 0 ? 0 : 1,
                        child: IconButton(
                          onPressed: _prevPlanet,
                          icon: const Icon(Icons.chevron_left),
                          iconSize: 32,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 400,
                          width: 300,
                          child: Flutter3DViewer(
                            controller: modelCache[_currentPlanet]!,
                            src: planetModels[_currentPlanet],
                            onProgress: (double progressValue) {
                              debugPrint('Loading progress: $progressValue');
                            },
                            onError: (String error) {
                              debugPrint('Model failed to load: $error');
                            },
                          ),
                        ),
                      ),
                      Opacity(
                        opacity:
                            _currentPlanet == Planets.values.length-1 ? 0 : 1,
                        child: IconButton(
                          onPressed: _nextPlanet,
                          icon: const Icon(Icons.chevron_right),
                          iconSize: 32,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Planets.values[_currentPlanet].name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(planetDescriptions[_currentPlanet]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

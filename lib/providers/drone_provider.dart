import 'package:flutter/material.dart';

class DroneData {
  final String id;
  final String name;
  final double battery;
  final double latitude;
  final double longitude;
  final bool isConnected;
  final List<Issue> issues;

  DroneData({
    required this.id,
    required this.name,
    required this.battery,
    required this.latitude,
    required this.longitude,
    required this.isConnected,
    required this.issues,
  });
}

class Issue {
  final String id;
  final String description;
  final String severity;
  final String location;
  final DateTime detectedAt;

  Issue({
    required this.id,
    required this.description,
    required this.severity,
    required this.location,
    required this.detectedAt,
  });
}

class DroneProvider extends ChangeNotifier {
  List<DroneData> _availableDrones = [];
  DroneData? _selectedDrone;
  bool _isMonitoring = false;
  double _monitoringProgress = 0.0;
  DroneData? _monitoringResult;

  List<DroneData> get availableDrones => _availableDrones;
  DroneData? get selectedDrone => _selectedDrone;
  bool get isMonitoring => _isMonitoring;
  double get monitoringProgress => _monitoringProgress;
  DroneData? get monitoringResult => _monitoringResult;

  DroneProvider() {
    _initializeDrones();
  }

  void _initializeDrones() {
    _availableDrones = [
      DroneData(
        id: 'DRN-IR-07',
        name: 'Railway Inspector 07',
        battery: 64.0,
        latitude: 28.7041,
        longitude: 77.1025,
        isConnected: false,
        issues: [
          Issue(
            id: 'ISS-001',
            description: 'Missing fasteners detected',
            severity: 'High',
            location: 'Track Section A-12',
            detectedAt: DateTime.now().subtract(const Duration(hours: 2)),
          ),
          Issue(
            id: 'ISS-002',
            description: 'Vegetation encroachment',
            severity: 'Medium',
            location: 'Track Section A-15',
            detectedAt: DateTime.now().subtract(const Duration(hours: 1)),
          ),
          Issue(
            id: 'ISS-003',
            description: 'Rust formation on rails',
            severity: 'Low',
            location: 'Track Section A-18',
            detectedAt: DateTime.now().subtract(const Duration(minutes: 30)),
          ),
        ],
      ),
      DroneData(
        id: 'DRN-IR-12',
        name: 'Railway Inspector 12',
        battery: 89.0,
        latitude: 28.6129,
        longitude: 77.2295,
        isConnected: false,
        issues: [],
      ),
      DroneData(
        id: 'DRN-IR-15',
        name: 'Railway Inspector 15',
        battery: 45.0,
        latitude: 28.5355,
        longitude: 77.3910,
        isConnected: false,
        issues: [],
      ),
    ];
    notifyListeners();
  }

  void selectDrone(DroneData drone) {
    _selectedDrone = drone;
    notifyListeners();
  }

  void connectDrone(DroneData drone) {
    final index = _availableDrones.indexWhere((d) => d.id == drone.id);
    if (index != -1) {
      _availableDrones[index] = DroneData(
        id: drone.id,
        name: drone.name,
        battery: drone.battery,
        latitude: drone.latitude,
        longitude: drone.longitude,
        isConnected: true,
        issues: drone.issues,
      );
      _selectedDrone = _availableDrones[index];
      notifyListeners();
    }
  }

  void disconnectDrone(DroneData drone) {
    final index = _availableDrones.indexWhere((d) => d.id == drone.id);
    if (index != -1) {
      _availableDrones[index] = DroneData(
        id: drone.id,
        name: drone.name,
        battery: drone.battery,
        latitude: drone.latitude,
        longitude: drone.longitude,
        isConnected: false,
        issues: drone.issues,
      );
      if (_selectedDrone?.id == drone.id) {
        _selectedDrone = null;
      }
      notifyListeners();
    }
  }

  Future<void> startMonitoring() async {
    if (_selectedDrone == null) return;

    _isMonitoring = true;
    _monitoringProgress = 0.0;
    notifyListeners();

    // Simulate monitoring progress
    for (int i = 0; i <= 100; i += 2) {
      await Future.delayed(const Duration(milliseconds: 150));
      _monitoringProgress = i / 100.0;
      notifyListeners();
    }

    _isMonitoring = false;
    _monitoringResult = _selectedDrone;
    notifyListeners();
  }

  void resetMonitoring() {
    _isMonitoring = false;
    _monitoringProgress = 0.0;
    _monitoringResult = null;
    notifyListeners();
  }

  List<DroneData> getRecentScans() {
    return _availableDrones.where((drone) => drone.issues.isNotEmpty).toList();
  }
}


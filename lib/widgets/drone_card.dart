import 'package:flutter/material.dart';
import 'package:drone_monitoring_system/providers/drone_provider.dart';

class DroneCard extends StatelessWidget {
  final DroneData drone;
  final VoidCallback onConnect;
  final VoidCallback? onDisconnect;

  const DroneCard({
    super.key,
    required this.drone,
    required this.onConnect,
    this.onDisconnect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF334155)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: drone.isConnected 
              ? const Color(0xFF3B82F6).withOpacity(0.5)
              : const Color(0xFF3B82F6).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: drone.isConnected
                        ? const Color(0xFF3B82F6).withOpacity(0.2)
                        : const Color(0xFF3B82F6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.flight,
                    color: drone.isConnected
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF94A3B8),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drone.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${drone.id}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: drone.isConnected
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    drone.isConnected ? 'Connected' : 'Available',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: drone.isConnected ? Colors.white : const Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Battery and Location Info
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    icon: Icons.battery_std,
                    label: 'Battery',
                    value: '${drone.battery.toInt()}%',
                    color: drone.battery > 50
                        ? Colors.green
                        : drone.battery > 20
                            ? Colors.orange
                            : Colors.red,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInfoItem(
                    icon: Icons.location_on,
                    label: 'Location',
                    value: '${drone.latitude.toStringAsFixed(2)}° N',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: drone.isConnected ? onDisconnect : onConnect,
                    icon: Icon(
                      drone.isConnected ? Icons.link_off : Icons.link,
                      size: 18,
                    ),
                    label: Text(
                      drone.isConnected ? 'Disconnect' : 'Connect',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: drone.isConnected
                          ? Colors.red.shade600
                          : const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    // Show drone details
                    _showDroneDetails(context);
                  },
                  icon: const Icon(Icons.info_outline, size: 18),
                  label: const Text('Details'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _showDroneDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(drone.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Drone ID', drone.id),
            _buildDetailRow('Battery Level', '${drone.battery.toInt()}%'),
            _buildDetailRow('Latitude', '${drone.latitude.toStringAsFixed(6)}° N'),
            _buildDetailRow('Longitude', '${drone.longitude.toStringAsFixed(6)}° E'),
            _buildDetailRow('Status', drone.isConnected ? 'Connected' : 'Available'),
            if (drone.issues.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Issues Detected:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...drone.issues.map((issue) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          size: 16,
                          color: issue.severity == 'High'
                              ? Colors.red
                              : issue.severity == 'Medium'
                                  ? Colors.orange
                                  : Colors.yellow.shade700,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${issue.description} (${issue.severity})',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NotificationData {
  final String id;
  final String title;
  final String message;
  final String type;
  final DateTime timestamp;
  final bool isRead;

  NotificationData({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    this.isRead = false,
  });

  NotificationData copyWith({
    String? id,
    String? title,
    String? message,
    String? type,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return NotificationData(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}

class NotificationProvider extends ChangeNotifier {
  List<NotificationData> _notifications = [];
  int _unreadCount = 0;

  List<NotificationData> get notifications => _notifications;
  int get unreadCount => _unreadCount;

  NotificationProvider() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    _notifications = [
      NotificationData(
        id: 'notif_001',
        title: 'System Update',
        message: 'Drone monitoring system has been updated to version 2.1.0',
        type: 'system',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      NotificationData(
        id: 'notif_002',
        title: 'New Issue Detected',
        message: 'High priority issue detected in Track Section A-12',
        type: 'alert',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      NotificationData(
        id: 'notif_003',
        title: 'Drone Maintenance',
        message: 'DRN-IR-07 requires scheduled maintenance',
        type: 'maintenance',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationData(
        id: 'notif_004',
        title: 'Report Generated',
        message: 'Monthly inspection report is ready for download',
        type: 'report',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
      ),
    ];
    _updateUnreadCount();
  }

  void _updateUnreadCount() {
    _unreadCount = _notifications.where((n) => !n.isRead).length;
  }

  void addNotification(NotificationData notification) {
    _notifications.insert(0, notification);
    _updateUnreadCount();
    notifyListeners();
  }

  void markAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      _updateUnreadCount();
      notifyListeners();
    }
  }

  void markAllAsRead() {
    _notifications = _notifications.map((n) => n.copyWith(isRead: true)).toList();
    _updateUnreadCount();
    notifyListeners();
  }

  void removeNotification(String notificationId) {
    _notifications.removeWhere((n) => n.id == notificationId);
    _updateUnreadCount();
    notifyListeners();
  }

  void clearAllNotifications() {
    _notifications.clear();
    _unreadCount = 0;
    notifyListeners();
  }

  List<NotificationData> getNotificationsByType(String type) {
    return _notifications.where((n) => n.type == type).toList();
  }
}


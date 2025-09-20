# Drone Monitoring System - Flutter Demo App

A comprehensive Flutter application simulating drone monitoring for Indian Railways infrastructure inspection.

## 🚀 Features

- **Splash Screen** with railway branding and smooth animations
- **Authentication** with hardcoded demo credentials
- **Dashboard** with railway news and recent scans
- **Drone Discovery** with radar animation and drone list
- **Real-time Monitoring** with progress indicators
- **Results Analysis** with issue detection and PDF export
- **Admin Panel** for system management
- **Responsive Design** with professional UI/UX

## 🔑 Demo Credentials

- **User ID:** `gov_demo`
- **Password:** `Rail@2025`

## 📱 Screens

1. **SplashScreen** - Railway branding with logo animation
2. **LoginPage** - Authentication with demo credentials
3. **DashboardPage** - News cards, FAB, and recent scans
4. **DroneDiscoveryPage** - Radar animation and drone selection
5. **MonitoringPage** - Progress indicators and real-time monitoring
6. **ResultsPage** - Issue analysis and PDF report generation
7. **AdminPanelPage** - System administration and data management

## 🛠️ Tech Stack

- **Flutter** - Cross-platform mobile development
- **Provider** - State management
- **Go Router** - Navigation
- **Lottie** - Animations
- **PDF** - Report generation
- **Google Fonts** - Typography
- **Material Design** - UI components

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  go_router: ^12.1.3
  lottie: ^2.7.0
  animations: ^2.0.8
  pdf: ^3.10.7
  printing: ^5.11.1
  google_fonts: ^6.1.0
  intl: ^0.19.0
```

## 🎨 Design System

- **Primary Color:** Indian Railways Blue (#1E3A8A)
- **Typography:** Inter font family
- **Style:** Clean, minimal, professional
- **Animations:** Smooth transitions and micro-interactions
- **Responsive:** Mobile-first design approach

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd drone_monitoring_system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Demo Data

The app includes mock data for demonstration:

- **Drone:** DRN-IR-07 (28.7041° N, 77.1025° E, 64% battery)
- **Issues:** Missing fasteners, Vegetation encroachment, Rust formation
- **Severity Levels:** Low, Medium, High
- **Locations:** Various railway track sections

## 🔧 Features Overview

### Authentication
- Secure login with validation
- Error handling with snackbar notifications
- Demo credentials for testing

### Dashboard
- Railway news cards with horizontal scrolling
- Recent scans list with issue indicators
- Floating Action Button for new scans
- Statistics and system status

### Drone Discovery
- Animated radar scanning interface
- Available drones list with connection status
- Battery levels and location information
- Connect/disconnect functionality

### Monitoring
- Real-time progress indicators
- Circular and linear progress bars
- Animated drone status
- Monitoring status messages

### Results Analysis
- Detailed issue cards with severity indicators
- Interactive map placeholder
- PDF report generation
- Issue categorization and filtering

### Admin Panel
- System statistics dashboard
- Drone management interface
- Issue addition and editing
- System reset capabilities

## 📄 PDF Reports

The app generates comprehensive PDF reports including:
- Drone information and location data
- Detected issues with severity levels
- Timestamps and location details
- Professional formatting with Indian Railways branding

## 🎯 Use Cases

- Railway infrastructure inspection
- Safety monitoring and maintenance
- Issue detection and reporting
- Administrative oversight
- Data visualization and analysis

## 🔮 Future Enhancements

- Real drone hardware integration
- Live video streaming
- Advanced analytics dashboard
- Multi-language support
- Offline data synchronization
- Push notifications
- Cloud data storage

## 📞 Support

For technical support or questions about the Drone Monitoring System, please contact the development team.

---

**Developed for Indian Railways** 🚂  
*Advanced Drone Monitoring & Inspection System*


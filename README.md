# 🚂 Drone Monitoring System – Flutter Demo App
A comprehensive **Flutter application** simulating drone-based monitoring for **Indian Railways** infrastructure inspection.

---

## 📸 Overview
This project demonstrates a full workflow of a drone inspection system — from authentication to drone discovery, live monitoring, issue detection, and PDF report generation.

It is structured, scalable, and built with clean architecture principles.

---

## 🔑 Demo Credentials
User ID: gov_demo
Password: Rail@2025


---

## 🚀 Features

### 🔐 Authentication  
- Login with hardcoded demo credentials  
- Form validation  
- Error handling with Snackbars  

### 🏠 Dashboard  
- Railway news cards (horizontal scroll)  
- Recent scans with issue indicators  
- FAB for starting new drone scans  
- Quick stats  

### 📡 Drone Discovery  
- Radar-style scanning animation  
- Drone availability list  
- Battery, coordinates, status indicators  
- Connect/Disconnect flow  

### 🎯 Real-Time Monitoring  
- Circular and linear progress indicators  
- Live status messages  
- Smooth animations  

### 🩺 Results Analysis  
- Issue cards with severity colors  
- Location metadata  
- Interactive (mock) map placeholder  
- **Generate PDF Reports**  

### 🛠 Admin Panel  
- Drone management  
- Issue configuration  
- System statistics  
- Reset utilities  

---

## 🛠 Tech Stack
- **Flutter** – Cross-platform development  
- **Provider** – State management  
- **Go Router** – Navigation  
- **Lottie** – Animations  
- **PDF + Printing** – Report generation  
- **Google Fonts** – Typography  
- **Material 3** UI  

---

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
- **Primary Color:** Indian Railways Blue `#1E3A8A`
- **Font:** Inter
- **Style:** Minimal, professional, clean layout
- **Animations:** Micro-interactions & smooth transitions
- **Layout:** Fully responsive, mobile-first design

---

## 📱 Screens Included
- **SplashScreen** – Railway branding with animated logo  
- **LoginPage** – Secure authentication  
- **DashboardPage** – News feed, recent scans, FAB  
- **DroneDiscoveryPage** – Radar-style drone scanner  
- **MonitoringPage** – Live real-time monitoring indicators  
- **ResultsPage** – Issue analysis, insights, PDF generation  
- **AdminPanelPage** – Drone + system management tools  

---

## 🗂 Demo Data Included

### **Sample Drone**
- **ID:** `DRN-IR-07`  
- **Location:** `28.7041° N, 77.1025° E`  
- **Battery:** `64%`

### **Detected Issues**
- Missing fasteners  
- Vegetation encroachment  
- Rust formation  

### **Severity Levels**
- Low  
- Medium  
- High  

---

## 📄 PDF Report Includes
- Drone metadata  
- Coordinates & location details  
- Detected issues with severity color coding  
- Timestamp of inspection  
- Professional layout with Indian Railways branding  

---

## 🚀 Getting Started

### 1️⃣ Clone the repository
```sh
git clone https://github.com/ntbnaren7/railwaytrack_monitoring_sys-appui
cd drone_monitoring_system
```

### 2️⃣ Install dependencies
```sh
flutter pub get
```

### 3️⃣ Run the app
```sh
flutter run
```

---

## 🎯 Use Cases
- Railway track inspection  
- Maintenance scheduling  
- Issue detection  
- Operations monitoring  
- Administrative audit reporting  

---

## 🔮 Future Enhancements
- Real drone hardware integration  
- Live video streaming  
- Cloud sync & analytics dashboard  
- Offline mode  
- Push notifications  
- Multi-language support  

Developed for Indian Railways 🚂 - Smart India Hackathon 2025
Advanced Drone Monitoring & Inspection System

<div align="center">

# 🚚 **Dalelook Delivery Management System**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![Google Maps](https://img.shields.io/badge/Google_Maps-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)](https://developers.google.com/maps)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

**A comprehensive delivery management ecosystem built with Flutter, featuring real-time tracking, multi-platform support, and seamless integration.**

[![GitHub followers](https://img.shields.io/github/followers/oiu85?style=social)](https://github.com/oiu85)
[![GitHub stars](https://img.shields.io/github/stars/oiu85/delivery?style=social)](https://github.com/oiu85/delivery/stargazers)

---

</div>

## 🌟 **Overview**

**Dalelook Delivery Management System** is a cutting-edge, multi-platform solution designed to revolutionize delivery operations. Built with Flutter and powered by Firebase, this comprehensive ecosystem provides seamless delivery management across mobile and web platforms.

### 🎯 **Core Components**

| Component | Platform | Description |
|-----------|----------|-------------|
| 📱 **Delivery Driver App** | Flutter Mobile | Real-time order management and GPS tracking |
| 🛒 **E-commerce Customer App** | Flutter Mobile | Customer-facing shopping and order tracking |
| 🎛️ **Admin Control Panel** | Flutter Mobile | Administrative management interface |
| 🌐 **Web Admin Dashboard** | Web Application | Browser-based administrative control |

---

## ✨ **Key Features**

### 🚀 **Delivery Driver App**
- **Real-time GPS Tracking** with Google Maps integration
- **Order Management** - Pending, Accepted, and Completed orders
- **Push Notifications** for instant order updates
- **Route Optimization** with polyline navigation
- **Offline Support** with local data caching
- **Multi-language Support** (Arabic/English)
- **QR Code Scanning** for order verification

### 🛍️ **E-commerce Customer App**
- **Product Catalog** with categories and search
- **Shopping Cart** with persistent storage
- **Order Tracking** with real-time updates
- **Payment Integration** (Cash on Delivery)
- **User Authentication** with verification
- **Address Management** with GPS integration
- **Review & Rating System**

### 🎛️ **Admin Control Panel**
- **Order Management** across all stages
- **Driver Assignment** and tracking
- **Analytics Dashboard** with insights
- **User Management** and permissions
- **Settings Configuration**
- **Notification Management**

### 🌐 **Web Admin Dashboard**
- **Cross-platform Access** from any browser
- **Real-time Analytics** and reporting
- **Bulk Operations** and management tools
- **Advanced Filtering** and search capabilities
- **Export Functionality** for data analysis

---

## 🛠️ **Technology Stack**

### **Frontend**
- **Flutter 3.7.2+** - Cross-platform UI framework
- **Dart** - Programming language
- **GetX** - State management and navigation
- **Material Design 3** - Modern UI components

### **Backend & Services**
- **Firebase Firestore** - Real-time database
- **Firebase Messaging** - Push notifications
- **Google Maps API** - Location services
- **REST API** - Custom backend integration
- **SQLite** - Local data caching

### **Key Dependencies**
```yaml
# Core Framework
flutter: ^3.7.2
get: ^4.6.6

# Maps & Location
google_maps_flutter: ^2.12.1
geolocator: ^13.0.2
geocoding: ^3.0.0

# Firebase
firebase_messaging: ^15.1.6
cloud_firestore: ^5.6.0

# UI & Animation
lottie: ^3.2.0
cached_network_image: ^3.2.0
show_up_animation: ^2.0.0

# Utilities
qr_flutter: ^4.0.0
image_picker: ^1.1.2
shared_preferences: ^2.0.15
```

---

## 🚀 **Getting Started**

### **Prerequisites**
- Flutter SDK 3.7.2 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code
- Firebase project setup
- Google Maps API key

### **Installation**

1. **Clone the repository**
```bash
git clone https://github.com/oiu85/delivery.git
cd delivery
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure Firebase**
   - Add your `google-services.json` to `android/app/`
   - Configure Firebase in your project

4. **Set up Google Maps**
   - Add your API key to `android/app/src/main/AndroidManifest.xml`

5. **Run the application**
```bash
flutter run
```

---

## 📱 **App Screenshots**

<div align="center">

| Delivery App | Customer App | Admin Panel |
|--------------|--------------|-------------|
| ![Delivery App](assets/images/delivery-man.png) | ![Customer App](assets/images/1.png) | ![Admin Panel](assets/images/avatar.PNG) |
| Real-time tracking | Product catalog | Order management |

</div>

---

## 🏗️ **Project Architecture**

```
lib/
├── 📁 binding/           # Dependency injection
├── 📁 controller/        # Business logic (GetX)
│   ├── auth/            # Authentication controllers
│   ├── orders/          # Order management
│   └── tracking/        # GPS tracking logic
├── 📁 core/             # Core utilities
│   ├── constant/        # App constants
│   ├── functions/       # Utility functions
│   ├── services/        # Core services
│   └── localization/    # Multi-language support
├── 📁 data/             # Data layer
│   ├── datasource/      # API & local data sources
│   └── model/           # Data models
└── 📁 view/             # UI layer
    ├── screen/          # App screens
    ├── widget/          # Reusable widgets
    └── orders/          # Order-related views
```

---

## 🔧 **Configuration**

### **Environment Setup**
```dart
// Core configuration
class AppConfig {
  static const String baseUrl = 'YOUR_API_BASE_URL';
  static const String googleMapsKey = 'YOUR_GOOGLE_MAPS_KEY';
  static const String firebaseProjectId = 'YOUR_FIREBASE_PROJECT_ID';
}
```

### **Firebase Configuration**
```json
{
  "project_info": {
    "project_id": "your-project-id",
    "storage_bucket": "your-project-id.appspot.com"
  }
}
```

---

## 🌍 **Multi-Language Support**

The app supports multiple languages with easy localization:

- **Arabic** (العربية) - Primary language
- **English** - Secondary language
- **Easy Extension** - Add more languages

```dart
// Adding new language
class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'title': 'Delivery App',
    },
    'ar': {
      'title': 'تطبيق التوصيل',
    },
  };
}
```

---

## 📊 **Features Breakdown**

### 🎯 **Order Management**
- ✅ Order creation and assignment
- ✅ Real-time status updates
- ✅ Driver location tracking
- ✅ Delivery confirmation
- ✅ Order history and analytics

### 🗺️ **GPS & Navigation**
- ✅ Real-time location tracking
- ✅ Route optimization
- ✅ Polyline navigation
- ✅ Distance and duration calculation
- ✅ Offline map support

### 🔔 **Notifications**
- ✅ Push notifications
- ✅ Local notifications
- ✅ Real-time updates
- ✅ Custom notification sounds
- ✅ Notification history

### 🔐 **Security & Authentication**
- ✅ User authentication
- ✅ Role-based access control
- ✅ Data encryption
- ✅ Secure API communication
- ✅ Session management

---

## 🚀 **Performance Optimizations**

- **Lazy Loading** - Efficient data loading
- **Image Caching** - Optimized image handling
- **Offline Support** - Local data storage
- **Memory Management** - Efficient resource usage
- **Network Optimization** - Reduced API calls

---

## 🧪 **Testing**

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run widget tests
flutter test test/widget_test.dart
```

---

## 📈 **Contributing**

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'Add amazing feature'`)
4. **Push to the branch** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### **Development Guidelines**
- Follow Flutter best practices
- Write clean, documented code
- Add tests for new features
- Update documentation as needed

---

## 📝 **Changelog**

### **v1.0.0** (Latest)
- ✨ Initial release
- 🚀 Core delivery functionality
- 🗺️ GPS tracking integration
- 🔔 Push notifications
- 🌍 Multi-language support

---

## 🤝 **Support & Community**

<div align="center">

[![GitHub Issues](https://img.shields.io/github/issues/oiu85/delivery?style=for-the-badge)](https://github.com/oiu85/delivery/issues)
[![GitHub Discussions](https://img.shields.io/github/discussions/oiu85/delivery?style=for-the-badge)](https://github.com/oiu85/delivery/discussions)

</div>

### **Get Help**
- 📧 **Email**: [Contact Developer](mailto:your-email@example.com)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/oiu85/delivery/discussions)
- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/oiu85/delivery/issues)

### **Developer Profiles**
- 🐙 **GitHub**: [@oiu85](https://github.com/oiu85)
- 🔷 **GitLab**: [@love14144.mn](https://gitlab.com/love14144.mn)
- 📘 **Facebook**: [Developer Profile](https://www.facebook.com/share/18p8PYoVDw/)
- 📷 **Instagram**: [@85oiu](https://www.instagram.com/85oiu?igsh=MTF3bTR3ZWNveDEzYg==)

---

## 📄 **License**

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Abdullah Alatrash

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🙏 **Acknowledgments**

- **Flutter Team** - For the amazing framework
- **Firebase Team** - For excellent backend services
- **Google Maps** - For location services
- **Open Source Community** - For inspiration and support

---

<div align="center">

### ⭐ **Star this repository if you found it helpful!**

**Made with ❤️ by [Abdullah Alatrash](https://github.com/oiu85)**

[![GitHub stars](https://img.shields.io/github/stars/oiu85/delivery?style=social&label=Star)](https://github.com/oiu85/delivery/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/oiu85/delivery?style=social&label=Fork)](https://github.com/oiu85/delivery/network/members)

---

**🚀 Ready to revolutionize your delivery operations? Start building today!**

</div>

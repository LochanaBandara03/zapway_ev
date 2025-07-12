# Zapway - EV Charging Station Finder

Zapway is a modern Flutter application designed to help electric vehicle (EV) owners locate and share charging stations. The app provides real-time location-based services and a community-driven approach to expanding the EV charging network.

## Features

### Authentication
- Email and password-based user registration
- Secure login system using Firebase Authentication
- User session management

### Search & Navigation
- Interactive Google Maps integration
- Real-time location tracking
- Charging station search functionality
- Location-based services using Geolocator

### User Profile
- Personalized user profiles
- EV type management
- Contribution tracking system
- Low data mode option for data conservation
- Secure logout functionality

### UI/UX
- Modern, dark-themed interface
- Intuitive bottom navigation
- Responsive design for various screen sizes
- User-friendly interaction patterns

## Technical Stack

- **Framework**: Flutter
- **Language**: Dart
- **Authentication**: Firebase Auth
- **Maps**: Google Maps Flutter
- **Location Services**: 
  - Geolocator
  - Location package
- **State Management**: Flutter's built-in state management

## Getting Started

### Prerequisites
- Flutter SDK (^3.8.0)
- Dart SDK
- Firebase project setup
- Google Maps API key

### Installation

1. Clone the repository:
```bash
git clone https://github.com/LochanaBandara03/Zapway_mobile.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add your `google-services.json` for Android
   - Add your `GoogleService-Info.plist` for iOS

4. Set up Google Maps:
   - Add your Google Maps API key in AndroidManifest.xml and AppDelegate.swift

5. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── auth.dart         # Firebase authentication logic
├── main.dart         # Application entry point
├── pages/
│   ├── home.dart     # Home page implementation
│   ├── profile.dart  # User profile page
│   ├── search.dart   # Map and search functionality
│   ├── signin.dart   # Login page
│   └── signup.dart   # Registration page
└── assets/
    └── images/       # Application images and icons
```

## Future Enhancements

- [ ] Add charging station details
- [ ] Implement user reviews and ratings
- [ ] Add navigation to charging stations
- [ ] Implement real-time availability status
- [ ] Add payment integration
- [ ] Enhanced user profiles

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter Team for the amazing framework
- Firebase for authentication services
- Google Maps for location services

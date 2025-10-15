# Adhyan - AI-Powered EdTech Platform 🎓

[![Flutter](https://img.shields.io/badge/Flutter-3.9.0+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

A modern, comprehensive EdTech platform connecting students, parents, teachers, and school administrators through AI-powered features and intuitive design.

## ✨ Features

### 📱 Mobile App (Students & Parents)

**For Students:**

- 🎯 **Smart Dashboard**: Personalized learning hub with real-time stats
- 📚 **Daily Practice**: AI-powered questions with intelligent hints
- 🎮 **Educational Games**: Gamified learning across all subjects
- 📊 **Performance Analytics**: Detailed progress tracking with AI insights
- 🚀 **Career Guidance**: Personalized career assessment and roadmap
- 📅 **Smart Schedule**: Interactive timetable with live class status
- 🏆 **Leaderboards**: Competitive learning with achievements

**For Parents:**

- 👨‍👩‍👧‍👦 **Multi-Child Management**: Unified dashboard for all children
- 📈 **Real-time Tracking**: Live attendance and performance monitoring
- 💰 **Fee Management**: Secure online payments and transaction history
- 💬 **Communication Hub**: Direct messaging with teachers
- 📋 **Behavior Insights**: Comprehensive activity and behavior tracking
- 🤝 **Meeting Scheduler**: Easy parent-teacher appointment booking

### 🌐 Web Portal (Teachers & Admins)

**For Teachers:**

- 📖 **Lesson Planner**: AI-assisted curriculum planning
- 📝 **Smart Worksheets**: Auto-generated practice materials
- ✅ **Assessment Tools**: Intelligent test creation and grading
- 👥 **Class Management**: Student progress tracking and analytics

**For Administrators:**

- 🏫 **School Management**: Complete institutional oversight
- 👩‍🏫 **Staff Management**: Teacher onboarding and performance tracking
- 📊 **Analytics Dashboard**: School-wide performance insights
- ⚙️ **System Configuration**: Platform customization and settings

## 🏗️ Architecture

Built with **Clean Architecture** principles and modern Flutter best practices:

```
lib/
├── core/                          # Core utilities & configurations
│   ├── constants/                 # App-wide constants
│   │   ├── app_colors.dart       # Material Design 3 color palette
│   │   ├── app_sizes.dart        # Responsive sizing system
│   │   ├── app_strings.dart      # Internationalization-ready strings
│   │   └── app_images.dart       # Asset path constants
│   ├── theme/                    # Theming system
│   │   └── app_theme.dart        # Material Design 3 theme
│   └── widgets/                  # Reusable UI components
│       ├── custom_button.dart    # Consistent button variants
│       ├── custom_text_field.dart # Form input components
│       ├── custom_card.dart      # Card design system
│       └── skeleton_loader.dart   # Loading state components
├── features/                      # Feature-based modules
│   ├── auth/                     # Authentication & onboarding
│   ├── student/                  # Student-specific features
│   ├── parent/                   # Parent dashboard & tools
│   └── shared/                   # Cross-feature components
└── main.dart                     # App entry point
│       └── loading_error_widgets.dart
│
├── features/                     # Feature modules
│   ├── auth/                     # Authentication
│   │   └── presentation/
│   │       └── pages/
│   │           ├── splash_screen.dart
│   │           └── login_screen.dart
│   ├── student/                  # Student features
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── student_dashboard.dart
│   │       └── widgets/
│   │           ├── quick_stats_widget.dart
│   │           ├── action_grid_widget.dart
│   │           └── today_schedule_widget.dart
│   └── parent/                   # Parent features
│       └── presentation/
│           └── pages/
│               └── parent_dashboard.dart
│
└── main.dart                     # App entry point
```

## 🎨 Design System

### Color Palette

- **Primary**: Blue #2563EB (Trust, Intelligence)
- **Secondary**: Green #10B981 (Growth, Success)
- **Accent**: Orange #F59E0B (Energy, Attention)
- **Semantic Colors**: Success, Warning, Error, Info

### Typography

- **Font Family**: Poppins (Google Fonts)
- **Scales**: Display, Headline, Title, Body, Label

### Components

- **Buttons**: Elevated, Text, Outlined, Icon
- **Cards**: Standard, Gradient
- **Input Fields**: Custom styled with validation
- **Loading States**: Skeleton loaders, circular progress

## 📦 Dependencies

### Core Dependencies

- `flutter_riverpod`: State management
- `google_fonts`: Custom fonts
- `hive`: Local database
- `dio`: HTTP client
- `flutter_secure_storage`: Secure data storage

### UI Dependencies

- `fl_chart`: Data visualization
- `syncfusion_flutter_charts`: Advanced charts
- `shimmer`: Skeleton loading
- `cached_network_image`: Image caching
- `lottie`: Animations

### Firebase

- `firebase_core`: Firebase initialization
- `firebase_analytics`: Analytics
- `firebase_crashlytics`: Crash reporting
- `firebase_messaging`: Push notifications

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.9.0)
- Dart SDK
- Android Studio / VS Code
- Firebase account (for backend services)

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd adhyan
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Development Guidelines

### Best Practices Implemented

✅ **Use constants for reusable values** - All colors, sizes, and strings centralized  
✅ **Custom widgets for common UI** - Buttons, text fields, cards  
✅ **Stateless widgets over functions** - Better performance  
✅ **Minimal widget tree** - Optimized rendering  
✅ **Const constructors** - Improved performance  
✅ **Clean architecture** - Separation of concerns  
✅ **Skeleton loading** - Better UX during data fetch  
✅ **Update mechanism** - Version checking and force updates  
✅ **Service status monitoring** - Downtime detection

### Code Quality

- **Linting**: `flutter_lints` + `very_good_analysis`
- **Type Safety**: Strict null safety enabled
- **Code Generation**: `build_runner` for models and providers

## 📱 App Flow

### Student Flow

```
Splash → Login (Role: Student) → Dashboard → Features
├── Learn (Daily Practice, Tests, Resources)
├── Games (Educational Games, Leaderboard)
└── Profile (Settings, Performance)
```

### Parent Flow

```
Splash → Login (Role: Parent) → Dashboard → Child Selection
├── Attendance Tracking
├── Performance Reports
├── Fee Management
├── Communication
└── Behavior Tracking
```

## 🎯 Implementation Roadmap

### Phase 1: Foundation (Current) ✅

- [x] Project setup and structure
- [x] Core constants and theme
- [x] Custom reusable widgets
- [x] Authentication screens
- [x] Student dashboard
- [x] Parent dashboard

### Phase 2: Learning Features

- [ ] Daily practice module
- [ ] Mock tests with timer
- [ ] AI-powered hints
- [ ] Subject-wise learning
- [ ] Progress tracking

### Phase 3: Analytics & Games

- [ ] Performance dashboard
- [ ] Charts and visualizations
- [ ] Educational games lobby
- [ ] Leaderboard system
- [ ] Achievement system

### Phase 4: Career & Resources

- [ ] Career assessment
- [ ] Career exploration
- [ ] Study materials
- [ ] Timetable and syllabus
- [ ] School directory

### Phase 5: Advanced Features

- [ ] Offline-first architecture
- [ ] Update mechanism
- [ ] Biometric authentication
- [ ] Push notifications
- [ ] Real-time sync

### Phase 6: Web Portal

- [ ] Super admin panel
- [ ] School admin panel
- [ ] Teacher dashboard
- [ ] Test portal for students
- [ ] AI worksheet maker

## 🔐 Security Features

- Secure local storage with encryption
- Biometric authentication support
- Session timeout management
- Role-based access control
- Data validation and sanitization

## 📊 State Management

Using **Riverpod** for:

- Dependency injection
- State management
- Async data handling
- Provider composition
- Code generation support

## 🎨 UI/UX Highlights

- Material Design 3 principles
- Smooth animations and transitions
- Pull-to-refresh functionality
- Skeleton loading states
- Error handling with retry
- Offline mode indicators
- Dark mode support (future)

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📱 Build & Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Types of Contributions

- 🐛 **Bug Fixes**: Report and fix issues
- ✨ **New Features**: Add new functionality
- 📚 **Documentation**: Improve docs and guides
- 🎨 **UI/UX**: Enhance user experience
- 🧪 **Testing**: Add tests and improve coverage
- 🌐 **Translations**: Add i18n support

### Development Workflow

1. **Fork the repository**
2. **Create feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Follow coding standards**
   - Use the established patterns
   - Add tests for new features
   - Update documentation
   - Run `flutter analyze` and fix warnings
4. **Commit with descriptive messages**
   ```bash
   git commit -m 'feat: add amazing new feature'
   ```
5. **Push and create PR**
   ```bash
   git push origin feature/amazing-feature
   ```

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter_lints` for code analysis
- Prefer `const` constructors where possible
- Use descriptive variable and function names
- Add comments for complex logic

## 🐛 Issues & Bug Reports

Found a bug? Please help us improve by reporting it:

1. **Search existing issues** first
2. **Use issue templates** when creating new issues
3. **Provide detailed reproduction steps**
4. **Include screenshots/logs** if applicable
5. **Specify platform and Flutter version**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Adhyan EdTech Platform

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 🌟 Acknowledgments

- **Flutter Team** for the amazing framework
- **Material Design** for design guidelines
- **Riverpod** for excellent state management
- **Firebase** for backend services
- **Open Source Community** for inspiration and contributions

## 📞 Support & Contact

- **GitHub Issues**: [Report bugs and request features](../../issues)
- **Discussions**: [Community discussions](../../discussions)
- **Documentation**: Check the [Wiki](../../wiki) for detailed guides

## 🚀 Deployment

### Environment Setup

Create `.env` files for different environments:

```bash
# .env.dev
API_BASE_URL=https://dev-api.adhyan.com
FIREBASE_PROJECT_ID=adhyan-dev

# .env.prod
API_BASE_URL=https://api.adhyan.com
FIREBASE_PROJECT_ID=adhyan-prod
```

### CI/CD Pipeline

The project includes GitHub Actions workflows for:

- **Code Quality**: Linting, formatting, and analysis
- **Testing**: Unit and widget tests
- **Building**: APK/AAB generation for releases
- **Deployment**: Automated releases to app stores

## 📊 Analytics & Monitoring

- **Firebase Analytics**: User behavior tracking
- **Crashlytics**: Crash reporting and monitoring
- **Performance Monitoring**: App performance insights

## 🔄 Version Management

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes and improvements

## 🎯 Project Goals

1. **Accessibility**: Make quality education accessible to all
2. **Innovation**: Leverage AI to personalize learning
3. **Collaboration**: Foster better communication between stakeholders
4. **Performance**: Ensure smooth, fast user experience
5. **Scalability**: Design for growth and expansion

---

<div align="center">

**Made with ❤️ for the education community**

[⭐ Star this repo](../../stargazers) | [🍴 Fork it](../../fork) | [📝 Report an issue](../../issues/new)

</div>

## 📄 License

This project is proprietary and confidential.

## 👥 Team

- **Development Team**: Building the future of education
- **Design Team**: Creating delightful experiences
- **AI Team**: Powering intelligent features

## 📞 Support

For support, email support@adhyan.com or raise an issue in the repository.

---

**Made with ❤️ for education**

# Contributing to Adhyan EdTech Platform

Thank you for your interest in contributing to Adhyan! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Types of Contributions

We welcome all types of contributions:

- 🐛 **Bug Reports**: Found a bug? Let us know!
- ✨ **Feature Requests**: Have an idea? We'd love to hear it!
- 💻 **Code Contributions**: Bug fixes, new features, improvements
- 📚 **Documentation**: Help improve our docs
- 🎨 **UI/UX**: Design improvements and suggestions
- 🌐 **Translations**: Help make Adhyan accessible globally

### Before You Start

1. **Check existing issues** to see if your bug/feature is already reported
2. **Search pull requests** to avoid duplicate work
3. **Discuss major changes** by opening an issue first
4. **Follow our coding standards** outlined below

## 🚀 Development Setup

### Prerequisites

- Flutter SDK (>=3.9.0)
- Dart SDK (>=3.0.0)
- Git
- Your favorite IDE (VS Code/Android Studio recommended)

### Local Development

1. **Fork and Clone**

   ```bash
   git clone https://github.com/yourusername/adhyan.git
   cd adhyan
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the App**

   ```bash
   flutter run
   ```

4. **Run Tests**
   ```bash
   flutter test
   ```

## 📝 Coding Standards

### Dart/Flutter Guidelines

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter_lints` rules (already configured)
- Prefer `const` constructors when possible
- Use meaningful variable and function names
- Add comments for complex logic

### Project-Specific Standards

- **Constants**: Use centralized constants from `lib/core/constants/`
- **Widgets**: Create reusable widgets in `lib/core/widgets/`
- **Architecture**: Follow the established clean architecture pattern
- **State Management**: Use Riverpod for state management
- **Naming**: Use descriptive names following Dart conventions

### Code Style

```dart
// ✅ Good
class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

// ❌ Avoid
class studentdashboard extends StatefulWidget {
  studentdashboard();

  _StudentDashboardState createState() => _StudentDashboardState();
}
```

### File Organization

```
lib/
├── core/
│   ├── constants/          # App-wide constants
│   ├── theme/             # Theming
│   └── widgets/           # Reusable widgets
├── features/
│   └── [feature_name]/
│       ├── data/          # Data layer
│       ├── domain/        # Business logic
│       └── presentation/  # UI layer
└── main.dart
```

## 🔄 Pull Request Process

### 1. Create Feature Branch

```bash
git checkout -b feature/amazing-feature
# or
git checkout -b fix/bug-description
```

### 2. Make Your Changes

- Write clean, readable code
- Add tests for new functionality
- Update documentation if needed
- Follow the established patterns

### 3. Test Your Changes

```bash
# Run tests
flutter test

# Check for analysis issues
flutter analyze

# Format code
dart format .
```

### 4. Commit Guidelines

Use conventional commit messages:

```bash
# Features
git commit -m "feat: add student performance analytics"

# Bug fixes
git commit -m "fix: resolve login authentication issue"

# Documentation
git commit -m "docs: update setup instructions"

# Refactoring
git commit -m "refactor: optimize dashboard loading"
```

### 5. Create Pull Request

1. Push your branch to your fork
2. Create PR with descriptive title and description
3. Link related issues
4. Request review from maintainers

### PR Template

```markdown
## Description

Brief description of changes

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing

- [ ] Tests pass locally
- [ ] Manual testing completed
- [ ] New tests added if applicable

## Screenshots (if applicable)

Add screenshots for UI changes

## Checklist

- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings in flutter analyze
```

## 🐛 Bug Reports

When reporting bugs, please include:

### Required Information

- **Flutter version**: `flutter --version`
- **Dart version**: `dart --version`
- **Platform**: iOS/Android/Web
- **Device**: Model and OS version

### Bug Report Template

```markdown
**Describe the Bug**
Clear description of what the bug is.

**To Reproduce**
Steps to reproduce:

1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected Behavior**
What you expected to happen.

**Screenshots**
Add screenshots if applicable.

**Additional Context**
Any other context about the problem.
```

## ✨ Feature Requests

### Feature Request Template

```markdown
**Is your feature request related to a problem?**
Clear description of the problem.

**Describe the solution you'd like**
Clear description of what you want to happen.

**Describe alternatives you've considered**
Alternative solutions or features considered.

**Additional context**
Any other context, screenshots, or mockups.
```

## 🏆 Recognition

Contributors will be recognized in:

- README.md contributors section
- Release notes for significant contributions
- Special thanks in documentation

## 📞 Getting Help

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and community discussions
- **Code Review**: Maintainers will review PRs and provide feedback

## 🎯 Priority Areas

We're especially looking for contributions in:

1. **UI/UX Improvements**: Making the app more user-friendly
2. **Performance Optimization**: Improving app speed and responsiveness
3. **Testing**: Adding unit and widget tests
4. **Documentation**: Improving guides and API docs
5. **Accessibility**: Making the app accessible to all users
6. **Internationalization**: Adding multi-language support

## 📋 Development Checklist

Before submitting your contribution:

- [ ] Code follows project style guidelines
- [ ] Tests added/updated and passing
- [ ] Documentation updated (if applicable)
- [ ] `flutter analyze` shows no new issues
- [ ] Manual testing completed
- [ ] PR description is clear and complete
- [ ] Commits follow conventional format
- [ ] No merge conflicts with main branch

## 🚫 What Not to Contribute

Please avoid:

- Formatting-only changes without functional improvements
- Breaking changes without discussion
- Large refactors without prior approval
- Duplicate features or bug fixes
- Changes that don't align with project goals

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to Adhyan! Together, we're building something amazing for the education community. 🎓

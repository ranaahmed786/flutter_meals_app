# Flutter Meals App

A comprehensive cross-platform mobile application for discovering and managing recipes, built with Flutter and featuring a modern Material Design 3 interface.

## Overview

Flutter Meals App is a feature-rich recipe management application that allows users to browse meal categories, discover new recipes, apply dietary filters, and maintain a personalized list of favorite meals. The application demonstrates modern Flutter development practices including state management with Riverpod, responsive design, and clean architecture patterns.

## Features

### Core Functionality
- **Recipe Discovery**: Browse through 10 different meal categories including Italian, Asian, German, Quick & Easy, and more
- **Detailed Recipe Information**: View comprehensive meal details including ingredients, step-by-step cooking instructions, duration, complexity, and cost estimates
- **Favorites Management**: Add and remove meals from a personalized favorites list with persistent storage
- **Advanced Filtering**: Filter meals by dietary preferences including gluten-free, lactose-free, vegetarian, and vegan options
- **Responsive Navigation**: Intuitive tab-based navigation with drawer menu for additional options

### User Experience
- **Material Design 3**: Modern dark theme with custom color scheme and Google Fonts (Lato)
- **Smooth Animations**: Elegant transitions and visual feedback throughout the application including animated favorite star toggle with rotation transition
- **Hero Animations**: Seamless image transitions between meal list and detail screens
- **Image Loading**: Progressive image loading with fade-in animations and loading placeholders
- **Responsive Layout**: Optimized for various screen sizes and orientations

### Technical Features
- **State Management**: Riverpod for efficient and scalable state management
- **Clean Architecture**: Well-structured codebase with separation of concerns
- **Animations**: Custom AnimatedSwitcher with rotation transitions for enhanced user interactions
- **Hero Transitions**: Smooth image transitions between screens using Flutter's Hero widget
- **Cross-Platform**: Supports Android, iOS, Web, Windows, macOS, and Linux
- **Performance Optimized**: Efficient rendering and memory management

## Technical Specifications

### Dependencies
- **Flutter SDK**: ^3.8.1
- **flutter_riverpod**: ^2.6.1 - State management solution
- **google_fonts**: ^6.2.1 - Typography enhancement
- **transparent_image**: ^2.0.1 - Image loading optimization
- **cupertino_icons**: ^1.0.8 - iOS-style icons

### Architecture
```
lib/
├── main.dart                    # Application entry point
├── data/
│   └── categories_data.dart     # Static meal and category data
├── models/
│   ├── category.dart           # Category data model
│   └── meals.dart              # Meal data model with enums
├── provider/
│   ├── faviourtes_meal_pro.dart # Favorites state management
│   └── filters_provider.dart   # Filter state management
├── screens/
│   ├── categories_screen.dart   # Main categories grid view
│   ├── meals_screen.dart       # Meal list display
│   ├── meal_details_screen.dart # Individual meal details
│   ├── filters_screen.dart     # Dietary filter settings
│   └── tapbar_screen.dart      # Main navigation container
└── widgets/
    ├── category_card.dart      # Category display component
    ├── mainDrawer/
    │   ├── main_drawer.dart    # Navigation drawer
    │   └── drawer_item.dart    # Drawer menu items
    └── mealCard/
        ├── meal_card.dart      # Meal display component
        └── meal_card_trait.dart # Meal metadata display
```

## User Interface

### Main Screens

#### Categories Screen
<table>
<tr>
<td width="300px">

**Features:**
- Grid layout with 2 columns
- Gradient category cards with elevated shadows
- Touch interactions with splash effects
- 10 predefined categories with custom colors

**Components:**
- `CategoryCard` widgets with gradient backgrounds
- Responsive grid layout
- Material Design ripple effects

</td>
<td width="350px">


<img width="350" height="450" alt="image" src="https://github.com/user-attachments/assets/6badd8ea-2c22-43f1-876d-8095bb9bda00" />


</td>
</tr>
</table>

#### Meals List Screen
<table>
<tr>
<td width="300px">

**Features:**
- Vertical scrolling list of meal cards
- High-quality food images with fade-in loading
- Meal metadata display (duration, complexity, cost)
- Empty state handling with user guidance

**Components:**
- `MealCard` with stacked image and information overlay
- `MealCardTrait` for metadata display
- Progressive image loading

</td>
<td width="350px">

<img width="350" height="450" alt="image" src="https://github.com/user-attachments/assets/17486b3e-f15d-476b-ae56-b12173b8962c" />


</td>
</tr>
</table>

#### Meal Details Screen
<table>
<tr>
<td width="300px">

**Features:**
- Full-screen recipe view with scrollable content
- High-resolution meal images with hero animation transitions
- Organized ingredients and step-by-step instructions
- Animated favorite toggle with rotation transition effect
- Snackbar notifications for user actions

**Components:**
- Hero image display with seamless transitions
- Structured ingredient list
- Numbered cooking steps
- Interactive animated favorite star button with 200ms rotation effect

</td>
<td width="350px">

<img width="350" height="450" alt="image" src="https://github.com/user-attachments/assets/8f098bf7-f53a-41e3-b492-73fb46a2e7c2" />

</td>
</tr>
</table>

#### Filters Screen
<table>
<tr>
<td width="300px">

**Features:**
- Toggle switches for dietary preferences
- Real-time filter application
- Clear filter descriptions
- Persistent filter state across sessions

**Components:**
- `SwitchListTile` for each filter option
- Material Design switch components
- Descriptive subtitles for each filter

</td>
<td width="350px">

<img width="350" height="450" alt="image" src="https://github.com/user-attachments/assets/47f15049-7b99-42e6-83e0-d6bd4cbd379b" />


</td>
</tr>
</table>

#### Navigation Drawer
<table>
<tr>
<td width="300px">

**Features:**
- Gradient header with app branding
- Quick navigation to main sections
- Settings and filter access
- Consistent Material Design styling

**Components:**
- `DrawerHeader` with gradient background
- `DrawerItem` components for navigation
- Restaurant-themed iconography

</td>
<td width="350px">

<img width="350" height="450" alt="image" src="https://github.com/user-attachments/assets/9fcd73b2-84de-4534-9b10-e382964d7a7f" />


</td>
</tr>
</table>

### Design System

#### Color Palette
- **Primary**: Custom orange theme (`Color.fromARGB(255, 131, 57, 0)`)
- **Theme**: Dark theme with Material Design 3
- **Accents**: Category-specific colors (Purple, Red, Orange, Amber, Blue, Green, etc.)

#### Typography
- **Font Family**: Google Fonts Lato
- **Hierarchy**: Material Design text scales
- **Weights**: Regular, Bold for emphasis

#### Components
- **Elevated Cards**: Shadow depth for visual hierarchy
- **Gradient Backgrounds**: Category cards with alpha variations
- **Rounded Corners**: 10px border radius for modern appearance
- **Material Ripples**: Touch feedback throughout the interface

## Installation & Setup

### Prerequisites
- Flutter SDK (^3.8.1)
- Dart SDK
- IDE (VS Code, Android Studio, or IntelliJ)
- Android/iOS development tools (for mobile deployment)

### Getting Started

1. **Clone the Repository**
   ```bash
   git clone https://github.com/ranaahmed786/flutter_meals_app.git
   cd flutter_meals_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android
- Ensure Android SDK is installed
- Set up Android emulator or connect physical device
- Minimum SDK: API level specified in `android/app/build.gradle`

#### iOS
- Xcode installation required (macOS only)
- iOS Simulator or physical device
- Developer account for device deployment

#### Web
```bash
flutter run -d chrome
```

#### Desktop (Windows/macOS/Linux)
```bash
flutter run -d windows  # or macos, linux
```

## Development

### Project Structure
The application follows a feature-first architecture with clear separation of concerns:

- **Data Layer**: Static data and models in `lib/data/` and `lib/models/`
- **State Management**: Riverpod providers in `lib/provider/`
- **Presentation Layer**: Screens and widgets in `lib/screens/` and `lib/widgets/`
- **Application Layer**: Main app configuration in `lib/main.dart`

### State Management
The app uses Riverpod for state management with the following providers:
- `faviourtiesMealProvider`: Manages user's favorite meals
- `filtersProvider`: Handles dietary filter preferences
- `availableMealsProvider`: Provides filtered meal list based on current filters

### Data Models
- **Meal**: Complete recipe information with dietary flags
- **Category**: Meal categorization with visual theming
- **Enums**: Complexity, Affordability, and Filter types

## Contributing

### Code Standards
- Follow Flutter/Dart style guidelines
- Maintain consistent file and folder structure
- Use meaningful variable and function names
- Add comments for complex logic
- Ensure responsive design across platforms

### Development Workflow
1. Fork the repository
2. Create a feature branch
3. Implement changes with proper testing
4. Submit pull request with detailed description

## License

This project is created for educational and portfolio purposes. Please refer to the repository license for usage terms.

## Contact

**Developer**: Rana Ahmed  
**Repository**: [flutter_meals_app](https://github.com/ranaahmed786/flutter_meals_app)

---

Built with ❤️ using Flutter

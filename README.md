# Onboarding Screen App

This Flutter app demonstrates an onboarding flow with multiple screens, integrated with shared preferences to store onboarding state. The app allows users to skip or complete onboarding, and once completed, it will not show the onboarding screens again. The app uses smooth page indicators and a simple "Get Started" button to navigate to the home screen.

## Features
- Multi-screen onboarding flow.
- "Skip" button to jump to the last onboarding screen.
- SmoothPageIndicator for smooth transition and visual feedback.
- Persistent state management using shared preferences.
- "Get Started" button navigates to the home screen and updates the onboarding state.
- Clean and responsive UI design.

## Screenshots
| Onboarding Screen 1 | Onboarding Screen 2 | Onboarding Screen 3 |  
| ------------------- | ------------------- | ------------------- |  
| ![onboarding1](assets/images/onboarding1.png) | ![onboarding2](assets/images/onboarding2.png) | ![onboarding3](assets/images/onboarding3.png) |  

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/onboarding_screen_app.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies
The following packages are used in this project:

- `shared_preferences`: Used to save the onboarding state so that the onboarding screens appear only once.
- `smooth_page_indicator`: For a smooth and customizable page indicator.

To install the dependencies, run:
   ```bash
   flutter pub add shared_preferences
   flutter pub add smooth_page_indicator
   ```

## Code Highlights
- OnboardingItems: Contains the titles, descriptions, and images for the onboarding screens.
- OnboardingView: Manages the onboarding page view, including skip and next buttons, and checks if it's the last page.
- Shared Preferences: Stores a boolean value (`onboarding`) that determines if the onboarding should be shown again.

## Example Code Snippet:
   ```bash
    onPressed: () async {
      final pres = await SharedPreferences.getInstance();
      pres.setBool("onboarding", true);  // Save the onboarding status
      if(!mounted) return;
    
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()));
    },
   ```

## How It Works
- The onboarding state is saved using `SharedPreferences`. Once the user taps "Get Started", the app saves a `true` value under the key `onboarding`. This ensures that the onboarding screens won't be shown the next time the app is launched.
- The "Skip" button allows users to skip to the last screen, and the page indicators provide visual feedback on the user's progress through the onboarding flow.

## Conclusion
This onboarding screen project is a great starting point for adding onboarding to any Flutter app, with persistent state and a smooth user experience.

## Getting Started

To run this project on your local machine:

1. Clone the repository and open it in your IDE:
   ```bash
   git clone https://github.com/Bhavyansh03-tech/Timer.git
   ```
2. Run the project on an emulator or a physical device.
   ```bash
   flutter run
   ```
   
## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

## Contact

For questions or feedback, please contact [@Bhavyansh03-tech](https://github.com/Bhavyansh03-tech) on GitHub or connect with me on [LinkedIn](https://www.linkedin.com/in/bhavyansh03/).

---

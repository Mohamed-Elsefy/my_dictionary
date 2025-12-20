# my_dictionary

**my_dictionary** is a bilingual dictionary application (Arabic / English) built with Flutter. It allows users to manage words, add new words, edit or delete them, and add similar words and examples for each word. The app uses local storage via Hive and features a modern, interactive user interface.

---

## Features

- Add, edit, and delete words.
- Manage similar words and examples for each word.
- Search words with an animated search field.
- Pick a color for each word (Color Picker).
- Support Arabic and English languages with language badges.
- Reusable and interactive widgets.
- State management using **flutter_bloc** (ReadDataCubit and WriteDataCubit).
- Local data storage using **Hive**.
- Supports both Android and iOS with custom splash screen and app icon.

---

## Technologies Used

- Flutter SDK (>=3.10.3)
- flutter_bloc: State management
- hive + hive_flutter: Local storage
- flutter_native_splash: Splash screen
- flutter_launcher_icons: App icon generation
- get_it: Dependency injection
- equatable: Object comparison

---

## Project Structure

lib/
├── core/
│ ├── constants/ # Colors, sizes, spacing, strings
│ ├── utils/ # Extensions and helper functions
├── controllers/
│ ├── read_data_cubit/
│ └── write_data_cubit/
├── data/
│ └── models/ # WordModel
├── view/
│ ├── dialogs/ # Dialogs (Add, Update, Delete)
│ ├── screens/ # App screens
│ └── widgets/ # Reusable widgets

---

## License

- This project is not published to any app store (publish_to: 'none') and can be used as a personal reference or educational project.
# 🛒 E-Commerce App Home Page (Flutter)

A responsive and visually appealing **E-Commerce App Home Page** built using **Flutter** as part of an evaluation assignment.  
The application demonstrates modern UI design, responsive layouts, product listing, and basic navigation using mock data.

---

## 📌 Assignment Objective

To build a Flutter-based e-commerce home page that:
- Showcases featured products and promotions
- Displays product categories and listings
- Maintains clean UI/UX and responsiveness
- Demonstrates Flutter fundamentals and best practices

---

## ✨ Features

- **AppBar**
  - App title
  - Search icon
  - Cart icon with badge count

- **Promotional Banner**
  - Gradient banner showcasing offers

- **Categories Section**
  - Horizontally scrollable categories
  - Active category highlighting
  - Product filtering based on selection

- **Product Listing**
  - Grid layout with responsive column count
  - Product image, name, and price
  - Add-to-cart button

- **Navigation**
  - Tap on a product to open a placeholder Product Detail Page

- **Performance & UX**
  - Slivers for smooth scrolling
  - Image loading indicators
  - Error handling for broken images
  - Responsive layout for Android & iOS

---

## 📱 Screenshots

> Screenshots taken from Android & iOS emulators

### Home Page (Android)
![Android Home](<img width="491" height="1007" alt="image" src="https://github.com/user-attachments/assets/6d8fceb6-6c37-46b4-82d4-59c1b5419424" />
)

### Home Page (iOS)
![iOS Home](<img width="491" height="1007" alt="image" src="https://github.com/user-attachments/assets/0ae0ee85-190a-48a7-8da5-f2189026a7ef" />
)

### Product Detail Page
![Product Detail](<img width="473" height="1014" alt="image" src="https://github.com/user-attachments/assets/dd22e52b-f1b7-4dec-9b78-a39dbcd2b72e" />
)

---

## 🛠 Tech Stack

- **Flutter**
- **Dart**
- **Material 3 Design**
- **CustomScrollView & Slivers**

---

## 📦 Packages Used

| Package | Purpose |
|--------|--------|
| `flutter/material.dart` | Core UI framework |
| Material 3 | Modern UI theming |

*(No third-party dependencies were used to keep the project simple and easy to evaluate.)*

---

## 📂 Project Structure

lib/
├── main.dart
android/
ios/
assets/
screenshots/

yaml
Copy code

---

## ▶️ How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/abhi2811mishra/E-Commerce-App-Home-Page.git
Navigate to the project directory:

bash
Copy code
cd e_commerce_app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
🧠 Design Decisions
Used Material 3 for a clean and modern UI

Modular widgets for readability and scalability

setState for simple state management

Slivers to avoid nested scroll views and improve performance

MediaQuery-based responsiveness for multiple screen sizes

⚠️ Challenges Faced
Managing nested scrolling efficiently

Maintaining consistent UI spacing across devices

Handling network image loading and error states gracefully


👤 Author
Abhinav Mishra
Flutter Developer

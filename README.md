🏠 House Manager App

A smart home management Flutter app designed for roommates, families, or shared housing. It handles everything from cooking schedules to expense sharing — organized, efficient, and mobile.


🚀 Features

🍳 Cooking Schedule with cost planning

🧹 Cleaning & Repairs Task Manager

🛒 Purchase Planner for food & supplies

💰 Expense Sharing & Pie Charts

💬 Chat Room (Firebase-powered)

🔔 Push Notifications

👥 User Login + Role-Based Access (Admin/Roommate)

📦 Local Storage with Hive

📊 State Management using Provider


🛠 Tech Stack

Layer	Tool / Service

UI Framework	Flutter
State Mgmt	Provider
Local DB	Hive
Cloud	Firebase (Auth + Firestore)
Notifications	flutter_local_notifications
Charts	fl_chart




🔧 Installation

1. Clone the repo

git clone https://github.com/your-username/house_manager_flutter.git
cd house_manager_flutter


2. Install dependencies

flutter pub get


3. Add Firebase config files

android/app/google-services.json

ios/Runner/GoogleService-Info.plist



4. Run the app

flutter run





🔒 Firebase Security Rules

rules_version = '2';
service cloud.firestore {
  match /databases/{db}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /chats/{docId} {
      allow read, write: if request.auth != null;
    }
  }
}



🙌 Contributing

Pull requests welcome! For major changes, please open an issue first.



📬 Contact

Author: Segun Etomu
📧 Email: Abrahametomu@yahoo.com
🔗 GitHub: github.com/prcabrah


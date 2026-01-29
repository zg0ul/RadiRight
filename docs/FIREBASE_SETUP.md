# Firebase Setup Guide for RadiRight

This document provides step-by-step instructions for setting up Firebase for the RadiRight application.

## Table of Contents

1. [Create Firebase Project](#1-create-firebase-project)
2. [Configure Flutter App](#2-configure-flutter-app)
3. [Enable Authentication](#3-enable-authentication)
4. [Set Up Firestore Database](#4-set-up-firestore-database)
5. [Create Collections Structure](#5-create-collections-structure)
6. [Configure Security Rules](#6-configure-security-rules)
7. [Create Firestore Indexes](#7-create-firestore-indexes)
8. [Test Your Setup](#8-test-your-setup)

---

## 1. Create Firebase Project

### Step 1.1: Go to Firebase Console
1. Navigate to [Firebase Console](https://console.firebase.google.com/)
2. Sign in with your Google account

### Step 1.2: Create New Project
1. Click **"Create a project"** (or "Add project")
2. Enter project name: `RadiRight` (or your preferred name)
3. Choose whether to enable Google Analytics (optional, can disable for MVP)
4. Click **"Create project"**
5. Wait for project creation to complete
6. Click **"Continue"**

---

## 2. Configure Flutter App

### Step 2.1: Install FlutterFire CLI
```bash
# Install the FlutterFire CLI globally
dart pub global activate flutterfire_cli
```

### Step 2.2: Login to Firebase
```bash
# Login to Firebase (opens browser)
firebase login
```

### Step 2.3: Configure FlutterFire
```bash
# Run from your project root directory
flutterfire configure
```

This command will:
- Ask you to select your Firebase project
- Ask which platforms to configure (select iOS and Android)
- Generate `lib/firebase_options.dart` with your actual configuration
- Create necessary platform-specific files

### Step 2.4: Add Platform Apps (if not done by CLI)

#### For Android:
1. In Firebase Console, click **"Add app"** → Android icon
2. Android package name: `com.example.radi_right` (check `android/app/build.gradle`)
3. App nickname: `RadiRight Android`
4. Download `google-services.json`
5. Place it in `android/app/google-services.json`

#### For iOS:
1. In Firebase Console, click **"Add app"** → iOS icon
2. iOS bundle ID: `com.example.radiRight` (check `ios/Runner.xcodeproj/project.pbxproj`)
3. App nickname: `RadiRight iOS`
4. Download `GoogleService-Info.plist`
5. Place it in `ios/Runner/GoogleService-Info.plist`

---

## 3. Enable Authentication

### Step 3.1: Go to Authentication
1. In Firebase Console, select your project
2. In the left sidebar, click **"Build"** → **"Authentication"**
3. Click **"Get started"**

### Step 3.2: Enable Email/Password Provider
1. Go to **"Sign-in method"** tab
2. Click **"Email/Password"**
3. Toggle **"Enable"** to ON
4. Leave "Email link (passwordless sign-in)" disabled for now
5. Click **"Save"**

### Step 3.3: Configure Authentication Settings (Optional)
1. Go to **"Settings"** tab
2. Under **"User actions"**:
   - Enable "Email enumeration protection" for security
3. Under **"Authorized domains"**:
   - Add any custom domains if needed

---

## 4. Set Up Firestore Database

### Step 4.1: Create Database
1. In Firebase Console, click **"Build"** → **"Firestore Database"**
2. Click **"Create database"**
3. Choose **"Start in test mode"** (we'll add proper rules later)
4. Select a location closest to your users (e.g., `us-central1`, `europe-west1`)
5. Click **"Enable"**

### Step 4.2: Understand the Structure
RadiRight uses the following collections:

```
firestore/
├── users/                    # User profiles
├── subscriptions/            # User subscriptions
└── assessmentHistory/        # Completed assessments
```

---

## 5. Create Collections Structure

Collections are created automatically when you first write data, but here's the expected structure:

### 5.1: Users Collection

**Collection**: `users`
**Document ID**: `{userId}` (Firebase Auth UID)

| Field | Type | Description |
|-------|------|-------------|
| `email` | string | User's email address |
| `name` | string | User's display name (optional) |
| `createdAt` | timestamp | Account creation date |
| `lastLoginAt` | timestamp | Last login timestamp |

**Example Document**:
```json
{
  "email": "doctor@hospital.com",
  "name": "Dr. Ahmad",
  "createdAt": "2024-01-15T10:30:00Z",
  "lastLoginAt": "2024-01-20T08:15:00Z"
}
```

### 5.2: Subscriptions Collection

**Collection**: `subscriptions`
**Document ID**: `{userId}` (Firebase Auth UID)

| Field | Type | Description |
|-------|------|-------------|
| `tier` | string | `none`, `trial`, `monthly`, `yearly` |
| `startDate` | timestamp | Subscription start date |
| `endDate` | timestamp | Subscription end date |
| `isTrialUsed` | boolean | Whether user has used trial |
| `trialEndDate` | timestamp | When trial ends (if applicable) |
| `createdAt` | timestamp | Document creation timestamp |

**Example Document** (New Trial User):
```json
{
  "tier": "trial",
  "startDate": "2024-01-15T10:30:00Z",
  "endDate": "2024-01-22T10:30:00Z",
  "isTrialUsed": true,
  "trialEndDate": "2024-01-22T10:30:00Z",
  "createdAt": "2024-01-15T10:30:00Z"
}
```

**Example Document** (Paid Subscription):
```json
{
  "tier": "yearly",
  "startDate": "2024-01-15T10:30:00Z",
  "endDate": "2025-01-15T10:30:00Z",
  "isTrialUsed": true,
  "trialEndDate": "2024-01-10T10:30:00Z",
  "createdAt": "2024-01-15T10:30:00Z"
}
```

### 5.3: Assessment History Collection

**Collection**: `assessmentHistory`
**Document ID**: Auto-generated

| Field | Type | Description |
|-------|------|-------------|
| `userId` | string | Firebase Auth UID |
| `topicId` | string | Assessment topic ID |
| `topicName` | string | Topic name (for display) |
| `startedAt` | timestamp | When assessment started |
| `completedAt` | timestamp | When assessment completed |
| `answers` | array | List of answer records |
| `recommendations` | array | Final recommendations (optional) |
| `createdAt` | timestamp | Server timestamp |

**Answer Record Structure** (within `answers` array):
```json
{
  "nodeId": "shoulder_q1",
  "questionText": "What is the mechanism of injury?",
  "selectedOptionId": "shoulder_q1_a2",
  "selectedOptionText": "Trauma"
}
```

**Example Document**:
```json
{
  "userId": "abc123xyz",
  "topicId": "acute_shoulder_pain",
  "topicName": "Acute Shoulder Pain",
  "startedAt": "2024-01-20T08:15:00Z",
  "completedAt": "2024-01-20T08:18:30Z",
  "answers": [
    {
      "nodeId": "shoulder_q1",
      "questionText": "What is the primary symptom?",
      "selectedOptionId": "shoulder_q1_a1",
      "selectedOptionText": "Pain after trauma"
    },
    {
      "nodeId": "shoulder_q2",
      "questionText": "Patient age?",
      "selectedOptionId": "shoulder_q2_a2",
      "selectedOptionText": "40 years or older"
    }
  ],
  "recommendations": [
    {
      "modality": "X-ray",
      "procedure": "Shoulder radiographs",
      "appropriateness": "usuallyAppropriate",
      "radiation": "low"
    }
  ],
  "createdAt": "2024-01-20T08:18:30Z"
}
```

---

## 6. Configure Security Rules

### Step 6.1: Go to Firestore Rules
1. In Firebase Console, go to **"Firestore Database"**
2. Click the **"Rules"** tab

### Step 6.2: Replace Default Rules
Replace the existing rules with the following:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Helper function to check if user is authenticated
    function isAuthenticated() {
      return request.auth != null;
    }

    // Helper function to check if user owns the resource
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }

    // Users collection
    // Users can only read and write their own profile
    match /users/{userId} {
      allow read: if isOwner(userId);
      allow create: if isOwner(userId);
      allow update: if isOwner(userId);
      allow delete: if false; // Prevent accidental deletion
    }

    // Subscriptions collection
    // Users can read their own subscription
    // Only backend/admin can write (for security)
    // For MVP: Allow users to create their own trial
    match /subscriptions/{userId} {
      allow read: if isOwner(userId);

      // Allow creating trial subscription (only if creating for self)
      allow create: if isOwner(userId)
        && request.resource.data.tier == 'trial'
        && request.resource.data.isTrialUsed == true;

      // Prevent users from updating their own subscription
      // (subscriptions should be managed by admin/payment system)
      allow update: if false;
      allow delete: if false;
    }

    // Assessment History collection
    // Users can read, create, and delete their own history
    match /assessmentHistory/{historyId} {
      allow read: if isAuthenticated()
        && resource.data.userId == request.auth.uid;

      allow create: if isAuthenticated()
        && request.resource.data.userId == request.auth.uid;

      allow delete: if isAuthenticated()
        && resource.data.userId == request.auth.uid;

      // Prevent updates to history (immutable records)
      allow update: if false;
    }

    // Deny all other access by default
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

### Step 6.3: Publish Rules
1. Click **"Publish"** to apply the rules
2. Wait for confirmation

### Important Security Notes

- **Subscriptions**: In the MVP, users can only create trial subscriptions. For paid subscriptions, you'll need to:
  - Use Firebase Admin SDK from a backend server
  - Or use Cloud Functions to handle payment webhooks
  - Then update the subscription document with admin privileges

- **Trial Abuse Prevention**: The current rules allow users to create a trial only once (via `isTrialUsed: true`). The app logic should check `isTrialUsed` before allowing trial creation.

---

## 7. Create Firestore Indexes

Some queries require composite indexes. Create these in the Firebase Console.

### Step 7.1: Go to Indexes
1. In Firebase Console, go to **"Firestore Database"**
2. Click the **"Indexes"** tab
3. Click **"Create index"**

### Step 7.2: Create Required Indexes

#### Index 1: Assessment History by User (sorted by date)
| Collection | Fields | Query Scope |
|------------|--------|-------------|
| `assessmentHistory` | `userId` (Ascending), `completedAt` (Descending) | Collection |

**To create:**
1. Collection ID: `assessmentHistory`
2. Add field: `userId` - Ascending
3. Add field: `completedAt` - Descending
4. Query scope: Collection
5. Click **"Create index"**

### Alternative: Auto-Create Indexes
Firestore will automatically suggest creating indexes when your app queries require them. You'll see error messages in the console with direct links to create the needed indexes.

---

## 8. Test Your Setup

### Step 8.1: Verify Firebase Connection
Run the app and check the console for Firebase initialization:
```bash
flutter run
```

You should see Firebase initialize without errors.

### Step 8.2: Test Authentication
1. Register a new user in the app
2. Check Firebase Console → Authentication → Users
3. Verify the new user appears

### Step 8.3: Test Firestore
1. After registration, check Firestore
2. Verify documents were created in:
   - `users/{userId}`
   - `subscriptions/{userId}`

### Step 8.4: Test Security Rules
Use the **Rules Playground** in Firebase Console:
1. Go to Firestore → Rules
2. Click **"Rules Playground"**
3. Test various scenarios:

**Test 1: Authenticated user reading own subscription**
- Simulation type: `get`
- Location: `subscriptions/USER_ID`
- Authenticated: Yes
- Provider: Custom
- UID: `USER_ID`
- Expected: **Allow**

**Test 2: User trying to read another user's subscription**
- Simulation type: `get`
- Location: `subscriptions/OTHER_USER_ID`
- Authenticated: Yes
- UID: `USER_ID`
- Expected: **Deny**

---

## Quick Reference: Firebase Console URLs

After creating your project, bookmark these URLs (replace `YOUR_PROJECT_ID`):

| Service | URL |
|---------|-----|
| Console Home | `https://console.firebase.google.com/project/YOUR_PROJECT_ID` |
| Authentication | `https://console.firebase.google.com/project/YOUR_PROJECT_ID/authentication/users` |
| Firestore | `https://console.firebase.google.com/project/YOUR_PROJECT_ID/firestore` |
| Firestore Rules | `https://console.firebase.google.com/project/YOUR_PROJECT_ID/firestore/rules` |

---

## Troubleshooting

### Common Issues

#### "Firebase not initialized"
- Ensure `firebase_options.dart` was generated correctly
- Verify `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are in correct locations

#### "Permission denied" errors
- Check security rules are published
- Verify user is authenticated before accessing Firestore
- Check the document path matches your rules

#### "Index required" errors
- Click the link in the error message to auto-create the index
- Or manually create it as described in Section 7

#### Android build fails
Ensure `android/build.gradle` has:
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'
    }
}
```

And `android/app/build.gradle` has at the bottom:
```gradle
apply plugin: 'com.google.gms.google-services'
```

#### iOS build fails
Ensure `ios/Podfile` has minimum iOS version:
```ruby
platform :ios, '13.0'
```

---

## Next Steps After Setup

1. **Add Admin SDK** (Future): For managing subscriptions securely
2. **Cloud Functions** (Future): For payment processing webhooks
3. **Firebase Analytics** (Optional): For usage tracking
4. **Firebase Crashlytics** (Recommended): For crash reporting

---

## Manual Subscription Management (MVP)

Since V1 doesn't have in-app payments, you'll manually activate subscriptions:

### Activate a Paid Subscription

1. Go to Firebase Console → Firestore
2. Find the user's subscription document: `subscriptions/{userId}`
3. Edit the document:
   ```json
   {
     "tier": "yearly",
     "startDate": [current timestamp],
     "endDate": [1 year from now],
     "isTrialUsed": true,
     "trialEndDate": [original trial end date]
   }
   ```
4. Save the document

### Extend a Subscription

1. Find the subscription document
2. Update the `endDate` field to the new expiration date
3. Save

---

## Summary Checklist

- [ ] Created Firebase project
- [ ] Ran `flutterfire configure`
- [ ] Enabled Email/Password authentication
- [ ] Created Firestore database
- [ ] Added security rules
- [ ] Created required indexes
- [ ] Tested authentication flow
- [ ] Tested Firestore read/write
- [ ] Verified security rules work correctly

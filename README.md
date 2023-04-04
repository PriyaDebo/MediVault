# MediVault - Medical Report Sharing and Analysis Application
MediVault is an android application which can be used by hospitals and patients to securely store, analyze, and share medical reports with ease.

```This repository houses the codebase for the front end of the application Medivault, developed for Google Solution Challenge, 2023. ```

To view the server side code, visit [MediVault - Server Side Code](https://github.com/progite/SolutionChallenge)


## General Features:
- Different account for patients and hospitals
- Hospital can add report to patients' account by providing their MediVault Id
- Patients can add report to their own account
- Patients can view the analysis of reports uploaded in their account

## Tech Stack:
- Client Side Code: Flutter
- Server Side Code: Flask
- API: Rest API
- Database: MySQL

## How To Use:
**Step 1:**
>[Install Flutter](https://flutter.dev/docs/get-started/install)

**Step 2:**
>Download or clone this repository by using the link given below.
```
https://github.com/PriyaDebo/MediVault.git
```
**Step 3:**
>Go to project root and execute the following command in console to get the required dependencies:
```
flutter pub get
```
**Step 4:**

```To run the app in Android Studio follow these steps:```
>- [Setup Android Studio for Flutter project.](https://flutter.dev/docs/get-started/editor?tab=androidstudio#androidstudio)
>- Go to **File > Open** and select the project folder from the location where it is downloaded.
>- Locate the main Android Studio toolbar.
 >- In the target selector, select an Android device for running the app. If none are listed as available, select Tools > AVD Manager and create one there.
 >- Click the run icon in the toolbar, or invoke the menu item Run > Run.
 >
```To run the app in Visual Studio Code follow these steps:```
>- [Setup Visual Studio Code for Flutter project.](https://flutter.dev/docs/get-started/editor?tab=vscode#vscode)
>- Go to **File > Open Folder** and select the project folder from the location where it is downloaded.
>- Locate the VS Code status bar (the blue bar at the bottom of the window).
>- Select a device from the Device Selector area. If no device is available and you want to use a device simulator, click  No Devices  and launch a simulator.
>-  Invoke  Run > Start Debugging  or press  F5.   Wait for the app to launch — progress is printed in the  Debug Console  view.
>
```After the app build completes, you’ll see the app on your device.```

**Step 5:**
>To successfully run the app, you need to install and run the server side of the application too. To do the same head to the following repository and follow the steps as mentioned there.
><br>([MediVault - Server Side Code](https://github.com/progite/SolutionChallenge))

**Step 6:**
>Also, make sure that the emulator or the device and the server side of the application is running under the same internet connection.
>Check the IPv4 address of your device and
```
	1. Open the file lib/apis/patient_service.dart
	2. Find the following code in line 9
	     final uriLink = "http://192.168.129.111:5000";
	3. Modify it with the ip configuration:
	     final uriLink = "http://<ip address>:5000;
```
```
	1. Open the file lib/apis/hospital_service.dart
	2. Find the following code in line 9
	     final uriLink = "http://192.168.129.111:5000";
	3. Modify it with the ip configuration:
	     final uriLink = "http://<ip address>:5000;
```
```
	1. Open the file lib/apis/report_service.dart
	2. Find the following code in line 8
	     final uriLink = "http://192.168.129.111:5000";
	3. Modify it with the ip configuration:
	     final uriLink = "http://<ip address>:5000;
```
>After completing the above steps, build the application for one more time.

## Folder Structure:
Here is the folder structure I have been using in this project:
```
android/
assets/
|- images
lib/
|- all components/
|- apis/
|- models/
|- operations/
|- screens/
|- constants.dart
|- main.dart
test/
```

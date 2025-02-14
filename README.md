# RedEyeAutoUITests

## Overview
This project contains automated UI tests for the **RedEye Rider App** using `XCTest` in Swift. The test suite includes a test case to book a ride from Snell Library to Home, ensuring app functionality and stability.

## Features
- **Automates RedEye Ride Booking**: The script launches the app, selects pickup and destination locations, and confirms the ride.
- **Uses XCTest Framework**: Ensures UI elements are present and functional.
- **Waits for Elements Dynamically**: Avoids race conditions with `waitForExistence`.
- **Tap Coordinates for Selection**: Handles location selection via screen coordinates.
- **Validates Ride Confirmation**: Verifies successful booking before terminating automation.

## Prerequisites
- macOS with Xcode installed.
- An iOS Simulator or physical device.
- Access to the **RedEye Rider App** with the correct bundle identifier (`com.ridewithvia.RedEyeRider`).
- **User must be logged into the RedEye Rider App and have a saved Home address.**

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/RedEyeAutoUITests.git
   cd RedEyeAutoUITests
   ```
2. Open the project in Xcode.
3. Ensure the **RedEye Rider App** is installed on the simulator/device.
4. Update the `bundleIdentifier` in the test file if needed.

## Running Tests
1. Select a simulator or connected device.
2. Run the tests using Xcode:
   - **Shortcut**: `Command + U`
   - Or, manually start tests via the **Test Navigator**.

## Troubleshooting
- **App not launching?**
  - Ensure the correct `bundleIdentifier` is set.
- **Elements not found?**
  - Increase timeout values in `waitForExistence`.
- **Coordinates incorrect?**
  - Adjust the `screenSize` multipliers to match different screen sizes.

## License
This project is licensed under the MIT License.

## Author
Developed by **Sai Mahitha Etikala**.


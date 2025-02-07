import XCTest

class RedEyeAutoUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testBookRideFromSnellToHome() throws {
        // Open RedEye App
        let redeyeApp = XCUIApplication(bundleIdentifier: "com.ridewithvia.RedEyeRider") // Replace with actual bundle ID
        redeyeApp.launch()
        sleep(3)  // Allow time for app to launch

        // Wait for the app to become idle before interacting
        let wheretobutton = redeyeApp.buttons["Where to?"]
        XCTAssertTrue(wheretobutton.waitForExistence(timeout: 10), "Where to? button not found")
        wheretobutton.tap()

        // Get screen size
        let screenSize = redeyeApp.windows.element(boundBy: 0).frame.size
        
        // Tap coordinates to select Pick up
        let PickupX = screenSize.width * 0.15
        let PickupY = screenSize.height * 0.15
        let PickupCoord = redeyeApp.coordinate(withNormalizedOffset: CGVector(dx: PickupX / screenSize.width, dy: PickupY / screenSize.height))
        PickupCoord.tap()
        
        let screenSize1 = redeyeApp.windows.element(boundBy: 0).frame.size
        // Tap coordinates to select Snell Library
        let snellLibraryX = screenSize1.width * 0.15
        let snellLibraryY = screenSize1.height * 0.40
        let snellLibraryCoord = redeyeApp.coordinate(withNormalizedOffset: CGVector(dx: snellLibraryX / screenSize1.width, dy: snellLibraryY / screenSize1.height))
        snellLibraryCoord.tap()

        // Tap coordinates to select Home (Destination)
        let homeX = screenSize.width * 0.15
        let homeY = screenSize.height * 0.20
        let destinationCoord = redeyeApp.coordinate(withNormalizedOffset: CGVector(dx: homeX / screenSize.width, dy: homeY / screenSize.height))
        destinationCoord.tap()

        // Select "Home" as destination
        let homeOption = redeyeApp.staticTexts["Home"]
        XCTAssertTrue(homeOption.waitForExistence(timeout: 5), "Home option not found")
        homeOption.tap()

        // Check for and tap the confirm button
        let confirmButton = redeyeApp.buttons["Book This Ride"]
        let okButton = redeyeApp.buttons["OK"]

        if confirmButton.waitForExistence(timeout: 5) {
            XCTAssertTrue(confirmButton.exists, "Confirm button not found")
            confirmButton.tap()
            let successMessage = redeyeApp.staticTexts["Ride Confirmed"]
            XCTAssertTrue(successMessage.waitForExistence(timeout: 10), "Ride confirmation message not found")
        } else if okButton.waitForExistence(timeout: 5) {
            XCTAssertTrue(okButton.exists, "'OK' button not found")
            okButton.tap()
        } else {
            XCTFail("Neither 'Book This Ride' nor 'OK' button found")
        }
    }
}

import XCTest

class BaseTestCase: XCTestCase {
    static let defaultTimeout: TimeInterval = 10.0
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        if #available(iOS 13.4, *) {
            app.resetAuthorizationStatus(for: .location)
        }
        XCUIDevice.shared.orientation = .portrait
        addUIInterruptionMonitor(withDescription: "System Dialog") { alert -> Bool in
            let button = alert.buttons.element(boundBy: 1)
            if button.waitForExistence(timeout: 2) {
                button.tap()
                return true
            }
            return false
        }
    }
}

import XCTest
@testable import RadarrCore

final class RadarrCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RadarrCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

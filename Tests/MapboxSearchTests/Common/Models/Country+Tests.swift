// Copyright © 2022 Mapbox. All rights reserved.

import XCTest
@testable import MapboxSearch

final class CountryTests: XCTestCase {
    func testThatCountryIsInitializedWithCorrectIdentifier() {
        let uppercasedIdentifier = Country(countryCode: "US")
        let lowercasedIdentifier = Country(countryCode: "us")

        XCTAssertNotNil(uppercasedIdentifier)
        XCTAssertTrue(uppercasedIdentifier?.countryCode == "us")
        
        XCTAssertNotNil(lowercasedIdentifier)
        XCTAssertTrue(lowercasedIdentifier?.countryCode == "us")
    }
    
    func testThatCountryIsNotInitializedWithIncorrectIdentifier() {
        let invalidIdentifier = Country(countryCode: "invalid")

        XCTAssertNil(invalidIdentifier)
    }
}

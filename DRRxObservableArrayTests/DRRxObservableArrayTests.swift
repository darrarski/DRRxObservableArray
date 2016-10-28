import XCTest

class DRRxObservableArrayTests: XCTestCase {

    func testInitialization() {
        let array = ObservableArray(["a", "b", "c"])
        XCTAssertEqual(array.elements, ["a", "b", "c"])
    }

}

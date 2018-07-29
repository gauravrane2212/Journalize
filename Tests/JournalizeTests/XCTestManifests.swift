import XCTest

extension JournalizeTests {
    static let __allTests = [
        ("testCreatingNewJournal", testCreatingNewJournal),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JournalizeTests.__allTests),
    ]
}
#endif

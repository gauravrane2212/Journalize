import Foundation
import XCTest
import Files
import JournalizeCore

class JournalizeTests: XCTestCase {
	fileprivate var testFolder: Folder!

	override func setUp() {
		super.setUp()
		testFolder = try? Folder.home.createSubfolderIfNeeded(withName: ".journalizeTests")
		FileManager.default.changeCurrentDirectoryPath(testFolder.path)
	}

	override func tearDown() {
		try! testFolder.delete()
		super.tearDown()
	}

	func testCreatingNewJournal() throws {
		// Empty the test folder to ensure a clean state
		try testFolder.empty()

		// Run the tool with the test arguments
		let arguments = [testFolder.path, "new", "Work"]
		try Journalize.run(with: arguments, folderPath: testFolder.path)

		// Assert that new Journal file was created
		XCTAssertNotNil(try? testFolder.file(named: "Work.txt"), "Could not create new Journal file")
	}
}

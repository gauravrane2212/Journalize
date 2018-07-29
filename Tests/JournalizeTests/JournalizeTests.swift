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
		let journalName = "Work"
		let arguments = [testFolder.path, "new", journalName]
		try Journalize.run(with: arguments, folderPath: testFolder.path)

		// Assert that new Journal file was created
		XCTAssertNotNil(try? testFolder.file(named: "\(journalName).txt"), "Could not create \"\(journalName)\" Journal file")
	}

	func testCreatingSameJournalTwice() throws {
		// Empty the test folder to ensure a clean state
		try testFolder.empty()

		// Run the tool with the test arguments
		let journalName = "Personal"
		let arguments = [testFolder.path, "new", journalName]
		try Journalize.run(with: arguments, folderPath: testFolder.path)

		// Assert that new Journal file was created
		XCTAssertNotNil(try? testFolder.file(named: "\(journalName).txt"), "Could not create \"\(journalName)\" Journal file")

		// Run the tool again with the same test arguments
		try Journalize.run(with: arguments, folderPath: testFolder.path)

		// Assert that a duplicate Journal isn't created
		let files = try FileManager().contentsOfDirectory(atPath: testFolder.path)
		XCTAssertTrue(files.count == 1, "Files count should be 1")
	}
}

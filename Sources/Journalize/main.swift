import Foundation
import JournalizeCore

do {
	try Journalize.run()
} catch {
	FileHandle.standardError.write("\(error)\n".data(using: .utf8)!)
	exit(1)
}

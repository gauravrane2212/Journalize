//
//  NewTask.swift
//  JournalizeCore
//
//  Created by Gaurav Rane on 7/25/18.
//

import Foundation

internal final class NewTask: Task, Executable {
	func execute() throws {
		guard let nameArgument = arguments.element(at: 2) else {
			throw Error.missingJournalName
		}

		try rootFolder.createFileIfNeeded(withName: "\(nameArgument).txt")
		print("🎊 \"\(nameArgument)\" journal sucessfully created!")
	}
}

extension NewTask {
	enum Error: Swift.Error {
		case missingJournalName
	}
}

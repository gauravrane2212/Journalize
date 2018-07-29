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

		let fileNameWithExtension = "\(nameArgument).txt"

		if rootFolder.containsFile(named: fileNameWithExtension) {
			printer.output("👀 \"\(nameArgument)\" journal already exists! Use \"journalize switch \(nameArgument)\" to use existing journal.")
		} else {
			try rootFolder.createFileIfNeeded(withName: fileNameWithExtension)
			printer.output("🎊 \"\(nameArgument)\" journal sucessfully created!")
		}
	}
}

extension NewTask {
	enum Error: Swift.Error {
		case missingJournalName
	}
}

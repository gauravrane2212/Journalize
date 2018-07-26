//
//  Command.swift
//  JournalizeCore
//
//  Created by Gaurav Rane on 7/25/18.
//

import Foundation

internal enum Command: String {
	case new
	case help
}

extension Command {
	var description: String {
		switch self {
		case .new:
			return "Creates a new Journal"
		case .help:
			return "Prints all available commands"
		}
	}

	init(arguments: [String], index: Int = 1) throws {
		guard let commandString = arguments.element(at: index) else {
			self = .help
			return
		}

		guard let command = Command(rawValue: commandString) else {
			throw Error.invalidCommandError
		}

		self = command
	}
}

extension Command {
	enum Error: Swift.Error {
		case invalidCommandError
	}
}

extension Array {
	func element(at index: Int) -> Element? {
		guard index < count else {
			return nil
		}
		return self[index]
	}
}


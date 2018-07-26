//
//  Journalize.swift
//  Journalize
//
//  Created by Gaurav Rane on 7/21/18.
//

import Foundation
import Files

public final class Journalize {

	public static func run(with arguments: [String] = CommandLine.arguments,
												 folderPath: String = "~/.journalize") throws {
		let command = try Command(arguments: arguments)
		let fileSystem = FileSystem()
		let rootFolder = try fileSystem.createFolderIfNeeded(at: folderPath)
		let executableTask: Executable = command.getExecutableTask(rootFolder, arguments)
		try executableTask.execute()
	}
}

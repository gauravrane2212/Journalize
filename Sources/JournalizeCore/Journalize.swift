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
												 folderPath: String = "~/.journalize",
												 printFunction: @escaping PrintFunction = {print($0)}) throws {
		let command = try Command(arguments: arguments)
		let printer = Printer(printFunction: printFunction)
		let fileSystem = FileSystem()
		let rootFolder = try fileSystem.createFolderIfNeeded(at: folderPath)
		let executableTask: Executable = command.getExecutableTask(rootFolder, arguments, printer)
		try executableTask.execute()
	}
}

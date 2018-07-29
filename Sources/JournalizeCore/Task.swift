//
//  Task.swift
//  JournalizeCore
//
//  Created by Gaurav Rane on 7/25/18.
//

import Foundation
import Files

public class Task {
	let rootFolder: Folder
	let arguments: [String]
	let printer: Printer

	init(rootFolder: Folder, arguments: [String], printer: Printer) {
		self.rootFolder = rootFolder
		self.arguments = arguments
		self.printer = printer
	}
}

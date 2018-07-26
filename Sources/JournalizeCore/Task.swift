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

	init(rootFolder: Folder, arguments: [String]) {
		self.rootFolder = rootFolder
		self.arguments = arguments
	}
}

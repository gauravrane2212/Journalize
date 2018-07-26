//
//  Journalize.swift
//  Journalize
//
//  Created by Gaurav Rane on 7/21/18.
//

import Foundation

public final class Journalize {

	public static func run(with arguments: [String] = CommandLine.arguments) throws {
		let command = try Command(arguments: arguments)
		print(command.description)
	}
}

//
//  Journalize.swift
//  Journalize
//
//  Created by Gaurav Rane on 7/21/18.
//

import Foundation

public final class Journalize {
	private let arguments: [String]

	public init(arguments: [String] = CommandLine.arguments) {
		self.arguments = arguments
	}

	public func run() throws {
		print("Setup is working!")
	}
}

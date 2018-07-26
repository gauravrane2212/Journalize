//
//  Printer.swift
//  JournalizeCore
//
//  Created by Gaurav Rane on 7/26/18.
//

import Foundation

public typealias PrintFunction = (String) -> Void

public final class Printer {
	let output: PrintFunction

	public init(printFunction: @escaping PrintFunction) {
		output = printFunction
	}
}

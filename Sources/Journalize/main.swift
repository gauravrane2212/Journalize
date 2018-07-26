import JournalizeCore

do {
	try Journalize.run()
} catch {
	print("Whoops! An error occured: \(error)")
}

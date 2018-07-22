import JournalizeCore

let tool = Journalize()

do {
	try tool.run()
} catch {
	print("Whoops! An error occured: \(error)")
}

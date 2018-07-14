import Foundation

do {
    let configUrl = URL(fileURLWithPath: Constant.configFilename)
    let data = try Data(contentsOf: configUrl)
    let config = try JSONDecoder().decode(Config.self, from: data)
    let feedParser = FeedParser(config: config)
    feedParser.start()
} catch {
    print("""
            Error reading config file.
            Error thrown: \(error.localizedDescription)
          """
    )
}

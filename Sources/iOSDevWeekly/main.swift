import Foundation

let currentDirectoryUrl = Bundle.main.executableURL?.deletingLastPathComponent() ?? URL(fileURLWithPath: "./", isDirectory: true)
let configUrl = currentDirectoryUrl.appendingPathComponent(Constant.configFilename)

do {
    let data = try Data(contentsOf: configUrl)
    let config = try JSONDecoder().decode(Config.self, from: data)
    let feedParser = FeedParser(config: config)
    feedParser.start()
} catch {
    print("""
            Error reading config file at \(configUrl).
            Error thrown: \(error.localizedDescription)
          """
    )
}

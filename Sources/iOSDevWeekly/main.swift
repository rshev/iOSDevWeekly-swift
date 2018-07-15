import Foundation

private func main() {
    let commandLineArguments = CommandLine.arguments.dropFirst()

    let configUrl: URL
    if
        let cmdlineArgument = commandLineArguments.first,
        FileManager.default.isReadableFile(atPath: cmdlineArgument)
    {
        configUrl = URL(fileURLWithPath: cmdlineArgument)
    } else {
        configUrl = CurrentDirectory.url.appendingPathComponent(Constant.configFilename)
    }

    do {
        let data = try Data(contentsOf: configUrl)
        let config = try JSONDecoder().decode(Config.self, from: data)
        let feedParser = FeedParser(config: config)
        feedParser.start()
    } catch {
        print("""
                Usage: config.json as the first argument, otherwise looks for it in the current executable directory.
                Error reading config file at \(configUrl).
                Error thrown: \(error.localizedDescription)
              """
        )
    }
}

main()

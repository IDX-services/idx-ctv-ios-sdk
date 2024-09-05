struct Config {
    struct Api {
        private static let baseUrl = "https://event.dxmdp.com/rest/api/v1"

        static let eventUrl = "\(Config.Api.baseUrl)/events-ctv"
        static let cookieIsEnabled = false
    }
}

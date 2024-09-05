enum ECTVEvent: String, Encodable {
    case PAGE_VIEW
}

enum ECTVError: Error {
    case cannotCreateUrl(from: String)
    case urlIsNil
    case responseIsEmpty
    case requestError
    case responseParseError
}

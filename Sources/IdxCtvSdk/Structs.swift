import Foundation

public struct EventRequestPropertiesStruct: Encodable {
    public let url: String
    public let title: String
    public let domain: String
    public let author: String
    public let category: String
    public let description: String
    public let tags: [String]
    public let devicePlatform: String

    public init(
        url: String,
        title: String,
        domain: String,
        author: String,
        category: String,
        description: String,
        tags: [String]
    ) {
        self.url = url
        self.title = title
        self.domain = domain
        self.author = author
        self.category = category
        self.description = description
        self.tags = tags
        self.devicePlatform = "MOBILE_APP"
    }
}

public struct EventRequestStruct: Encodable {
    let event: ECTVEvent
    let userId: String
    let providerId: String
    let properties: EventRequestPropertiesStruct
}

struct EventResponseAudienceStruct: Decodable {
    let audienceCode: String
    let expireTs: Int
    let revision: Int
}

struct EventResponseStruct: Decodable {
    let userId: String
    let audiences: [EventResponseAudienceStruct]
}

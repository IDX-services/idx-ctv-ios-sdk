import Foundation

public final class DmpCtv {
    let providerId: String
    let localStorage = UserDefaults.standard
    
    public init(providerId: String, appName: String, appVersion: String) {
        self.providerId = providerId
    }
    
    private func setUserId(userId: String) {
        localStorage.set(userId, forKey: "userId")
    }
    
    private func getUserId() -> String? {
        return localStorage.string(forKey: "userId")
    }
    
    private func setDefinitionIds(_ definitionIds: [String]) {
        localStorage.set(definitionIds, forKey: "definitionIdsList")
    }
    
    public func getDefinitionIds() -> [String] {
        return localStorage.stringArray(forKey: "definitionIdsList") ?? []
    }
    
    public func getDefinitionIdsAsString() -> String {
        return getDefinitionIds().joined(separator: ",")
    }
    
    public func sendPageViewEvent(properties: EventRequestPropertiesStruct, completionHandler: @escaping (Any?) -> Void = {_ in}) {
       
        let userId = getUserId() ?? ""

        let eventBody = EventRequestStruct(
            event: ECTVEvent.PAGE_VIEW,
            userId: userId,
            providerId: self.providerId,
            properties: properties
        )
        
        do {
            try Api.post(
                url: Config.Api.eventUrl,
                queryItems: ["dmpid": userId],
                body: eventBody
            ) {(data, error) in
                DispatchQueue.main.async {
                    let decoder = JSONDecoder()
                    
                    guard let response = data else {
                        return completionHandler(ECTVError.responseIsEmpty)
                    }
                    
                    guard let responseData: EventResponseStruct = try? decoder.decode(EventResponseStruct.self, from: response) else {
                        return completionHandler(ECTVError.responseParseError)
                    }
                    
                    self.setUserId(userId: responseData.userId)
                    self.setDefinitionIds(responseData.audiences.map({ return $0.audienceCode }))
                    
                    completionHandler(error)
                }
            }
        } catch {
            completionHandler(error)
        }
    }
}

//
//  NetworkingTargetType.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Moya

// MARK: - Networking Target Type
protocol NetworkingTargetType: TargetType {
    var requestBaseURL: URL { get }
    var requestPath: String { get }
    var requestHeaders: [String: String]? { get }
    var requestMethod: Moya.Method { get }
}

// MARK: - Networking Target Type default configuration
extension NetworkingTargetType {
    var requestBaseURL: URL {
        return URL(string: AppConfigurationManager.shared.getAppConfiguration(with: .baseURL) ?? "")!
    }
    
    var requestHeaders: [String: String]? {
        guard let readToken = AppConfigurationManager.shared.getAppConfiguration(with: .readToken) else {
            return ["accept": "application/json",
                    "Authorization": "Bearer \(AppConfigurationManager.shared.getAppConfiguration(with: .tmbdApiKey) ?? "")"]
        }
        
        return ["accept": "application/json",
                "Authorization": "Bearer \(readToken)"]
    }
}

extension NetworkingTargetType {
    var baseURL: URL {
        requestBaseURL
    }
    
    var path: String {
        requestPath
    }
    
    var method: Moya.Method {
        requestMethod
    }
    
    var headers: [String : String]? {
        requestHeaders
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    func parametersAsDictionary<T: Encodable>(_ parameters: T,
                                              with encoder: JSONEncoder = JSONEncoder()) -> [String: Any] {
        encoder.encodeAsDictionary(parameters) ?? [:]
    }
}

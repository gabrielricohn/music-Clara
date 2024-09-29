//
//  NetworkingSession.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Moya

enum NetworkingSession {
    // MARK: - Default Networking Session
    static let `default`: Session = {
        let configuration: URLSessionConfiguration = .default
        configuration.headers = .default
        
        return .init(configuration: configuration)
    }()
}

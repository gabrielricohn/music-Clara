//
//  NetworkingRequester.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Moya
import Combine

// MARK: - Data Response
struct DataResponse {
    let data: Data
    let httpResponse: HTTPURLResponse?
}

// MARK: - Decoded Response
struct DecodedResponse<T: Decodable> {
    let object: T
    let httpResponse: HTTPURLResponse?
}

// MARK: - Networking Requester Type
protocol NetworkingRequesterType {
    func execute(request: NetworkingTargetType) -> AnyPublisher<DataResponse, Error>
}

// MARK: - Networking Requester Implementation
struct NetworkingRequester: NetworkingRequesterType {
    // MARK: - Properties
    private let provider: MoyaProvider<MultiTarget>
    
    // MARK: - Initializer
    init(provider: MoyaProvider<MultiTarget> = .networkingProvider()) {
        self.provider = provider
    }
    
    // MARK: - Execute Functionality
    func execute(request: NetworkingTargetType) -> AnyPublisher<DataResponse, Error> {
        Future { seal in
            provider.request(MultiTarget(request)) { result in
                switch result {
                case .success(let response):
                    seal(.success(DataResponse(data: response.data, httpResponse: response.response)))
                case .failure(let error):
                    seal(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Default Implementation
extension NetworkingRequesterType {
    func execute<T: Decodable>(request: NetworkingTargetType, using decoder: JSONDecoder = .init()) -> AnyPublisher<T, Error> {
        execute(request: request)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }

    func execute<T: Decodable>(request: NetworkingTargetType, using decoder: JSONDecoder = .init()) -> AnyPublisher<DecodedResponse<T>, Error> {
        execute(request: request)
            .tryMap { try DecodedResponse(object: decoder.decode(T.self, from: $0.data), httpResponse: $0.httpResponse)  }
            .eraseToAnyPublisher()
    }
}

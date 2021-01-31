//
//  NetworkProvider.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct Endpoint {
    var url: URL
    var httpMethod: HTTPMethod
    var parameters: [String: Any]?

    init(url: URL, httpMethod: HTTPMethod, parameters: [String: Any]? = nil) {
        self.url = url
        self.httpMethod = httpMethod
        self.parameters = parameters
    }
}

typealias NetworkCompletionHandler = (Result<Data, Error>) -> Void

protocol NetworkProviderType {
    func sendRequest(_ target: TargetType, completion: @escaping(NetworkCompletionHandler))
}

class NetworkProvider: NetworkProviderType {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    func sendRequest(_ target: TargetType, completion: @escaping(NetworkCompletionHandler)) {

        dataTask?.cancel()

        if var urlComponents = URLComponents(url: target.baseURL, resolvingAgainstBaseURL: false) {
            urlComponents.query = target.path
            guard let url = urlComponents.url else {
                return
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = target.method.rawValue
            dataTask = defaultSession.dataTask(with: urlRequest) { [weak self] data, response, error in
                    defer {
                        self?.dataTask = nil
                    }

                    if let error = error {
                        completion(.failure(error))
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                        DispatchQueue.main.async {
                            completion(.success(data))
                        }
                    }
            }
            dataTask?.resume()
        }

    }
}

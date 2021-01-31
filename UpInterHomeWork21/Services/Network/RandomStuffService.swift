//
//  RandomStuffService.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation

protocol RandomStuffServiceType {
    func fetchRandomStrings(with count: Int, completion: @escaping (Result<RandomString, Error>) -> Void)
}

class RandomStuffService: RandomStuffServiceType {

    var provider: NetworkProviderType

    init(provider: NetworkProviderType) {
        self.provider = provider
    }

    func fetchRandomStrings(with count: Int, completion: @escaping (Result<RandomString, Error>) -> Void) {
        provider.sendRequest(RandomOrgTarget.randomStrings(count: count)) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(RandomString.parse(from: data)))
            }
        }
    }
}

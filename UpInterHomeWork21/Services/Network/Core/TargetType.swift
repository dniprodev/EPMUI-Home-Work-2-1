//
//  TargetType.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
}

extension TargetType {

    var url: URL {
        return path.isEmpty ? baseURL : baseURL.appendingPathComponent(path)
    }

    var parameters: [String: Any]? {
        return nil
    }
}

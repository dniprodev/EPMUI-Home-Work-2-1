//
//  RandomOrgTarget.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 07.12.2020.
//

import Foundation

enum RandomOrgTarget {
    case randomStrings(count: Int)
}

extension RandomOrgTarget: TargetType {
    var baseURL: URL {
        switch self {
        case .randomStrings:
            return URL(string: "https://www.random.org/strings/")!
        }
    }

    var path: String {
        switch self {
        case .randomStrings(let size):
            return "num=\(size)&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .randomStrings:
            return .get
        }
    }
}

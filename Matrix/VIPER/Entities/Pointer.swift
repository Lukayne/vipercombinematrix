//
//  Pointer.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation
import Combine

final class Pointer {
    @Published var positionX: Int = 0
    @Published var positionY: Int = 0
    var id: UUID

    init() {
        id = UUID()
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        positionX = try container.decode(Int.self, forKey: .positionX)
        positionY = try container.decode(Int.self, forKey: .positionY)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension Pointer: Codable {
    enum CodingKeys: CodingKey {
        case positionX
        case positionY
        case id
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(positionX, forKey: .positionX)
        try container.encode(positionY, forKey: .positionY)
        try container.encode(id, forKey: .id)
    }
}


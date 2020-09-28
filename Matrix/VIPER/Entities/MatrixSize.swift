//
//  MatrixSize.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation
import Combine

final class MatrixSize {
    @Published var width: Int = 0
    @Published var height: Int = 0
    var id: UUID

    init() {
        id = UUID()
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        width = try container.decode(Int.self, forKey: .width)
        height = try container.decode(Int.self, forKey: .height)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension MatrixSize: Codable {
    enum CodingKeys: CodingKey {
        case width
        case height
        case id
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
        try container.encode(id, forKey: .id)
    }
}

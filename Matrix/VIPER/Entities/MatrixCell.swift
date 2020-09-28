//
//  MatrixCell.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation
import Combine

final class MatrixCell {
    @Published var cellX: Int = 0
    @Published var cellY: Int = 0
    var id: UUID

    init() {
        id = UUID()
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cellX = try container.decode(Int.self, forKey: .cellX)
        cellY = try container.decode(Int.self, forKey: .cellY)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension MatrixCell: Codable {
    enum CodingKeys: CodingKey {
        case cellX
        case cellY
        case id
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cellX, forKey: .cellX)
        try container.encode(cellY, forKey: .cellY)
        try container.encode(id, forKey: .id)
    }
}

extension MatrixCell: Equatable {
    static func == (lhs: MatrixCell, rhs: MatrixCell) -> Bool {
        lhs.id == rhs.id
    }
}

extension MatrixCell: Identifiable {}
extension MatrixCell: ObservableObject {}

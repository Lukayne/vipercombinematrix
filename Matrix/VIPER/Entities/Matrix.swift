//
//  Matrix.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation
import Combine

enum Direction: Int, Codable {
    case north = 0
    case east = 90
    case south = 180
    case west = 270
}

final class Matrix {
    @Published var matrixSize: MatrixSize = MatrixSize()
    @Published var pointer: Pointer = Pointer()
    @Published var direction: Direction = Direction.north
    @Published var commands: Commands = Commands()

    let id: UUID

    init() {
        id = UUID()
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        matrixSize = try container.decode(MatrixSize.self, forKey: .matrixSize)
        pointer = try container.decode(Pointer.self, forKey: .pointer)
        direction = try container.decode(Direction.self, forKey: .direction)
        commands = try container.decode(Commands.self, forKey: .commands)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension Matrix: Codable {
    enum CodingKeys: CodingKey {
        case matrixSize
        case pointer
        case direction
        case commands
        case id
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(matrixSize, forKey: .matrixSize)
        try container.encode(pointer, forKey: .pointer)
        try container.encode(direction, forKey: .direction)
        try container.encode(commands, forKey: .commands)
        try container.encode(id, forKey: .id)
    }
}

extension Matrix: Equatable {
    static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        lhs.id == rhs.id
    }
}

extension Matrix: ObservableObject {}

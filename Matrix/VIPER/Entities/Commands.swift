//
//  Commands.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation
import Combine

enum GameCommands: Int, Codable {
    case quit
    case moveForwards
    case moveBackwards
    case rotatePointerDirectionClockwise
    case rotatePointerDirectionCounterClockwise
}

final class Commands {
    @Published var commands: [Int] = []
    @Published var gameCommands: GameCommands?
    var id: UUID

    init() {
        id = UUID()
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        commands = try container.decode([Int].self, forKey: .commands)
        gameCommands = try container.decode(GameCommands.self, forKey: .gameCommands)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension Commands: Codable {
    enum CodingKeys: CodingKey {
        case commands
        case gameCommands
        case id
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(commands, forKey: .commands)
        try container.encode(gameCommands, forKey: .gameCommands)
        try container.encode(id, forKey: .id)
    }
}


//
//  Constants.swift
//  Something
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation

#warning("Add documentation for why you are not using localization.")

struct Constants {
    struct GameInformation {
        static let openingMessage = "Are you ready to play a game?"
        static let messageForFirstInput = "Please: input width, height, starting pos x and y and seperate the values with a comma.\nHere's an example of how the starting input can be: 98,32,30,15"
        static let commandsMessage = "Now that we have your matrix and starting position set we will need a few commands.\nThese are the possible gaming commands: \n0 = quit the game and get the result \n1 = move forward one step \n2 = move backwards one step \n3 = rotate clockwise 90 degrees (eg north to east) \n4 = rotate counterclockwise 90 degrees (eg west to south)\nHere's a good example of how your input can be 112322131221410 or hhhwqeee999923231110.\nThe last input example will also work, we will parse the data for you."
        static let errorInputMessage = "Did you format your input correctly?"
        #warning("Add information to why this isn't being used.")
        static let correctCommands = "Thank you for entering the commands correctly!"
        static let letTheGamesBegin = "LET THE GAMES BEGIN!"

        static func correctStartingData(matrix: Matrix) -> String {
            return "This will be your matrix:\nWidth: \(matrix.matrixSize.width)\nHeight: \(matrix.matrixSize.height)\nThis is where you will start:\n[\(matrix.pointer.positionX), \(matrix.pointer.positionY)]"
        }
    }
    
    struct statusCodes {
        static let errorMessage = "[-1,-1]"
        static func successMessage(endPositionX: Int, endPositionY: Int) -> String {
            return "[\(endPositionX),\(endPositionY)]"
        }
    }
}

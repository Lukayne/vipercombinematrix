//
//  InputValidator.swift
//  Something
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation

class InputValidator {

    func validateStartingInput(startingInputData: String?, completion: (_ startingInputAsArray: [Int]?, _ correctInput: Bool) -> ()) {
        guard let startingValues = startingInputData else {
            completion(nil, false)
            return
        }

        if startingValues.isEmpty {
            completion(nil, false)
            return
        }

        var arrayOfStartingValues = [Int]()
        var temporaryString = ""
        #warning("Add documentation to why you allow invalid inputs.")
        for character in startingValues {
            if character.isWholeNumber {
                temporaryString.append(character)
            }

            if character == "," {
                if let stringToInt = Int(temporaryString) {
                    arrayOfStartingValues.append(stringToInt)
                    temporaryString = ""
                }
            }

            if arrayOfStartingValues.count == 5 {
                temporaryString = ""
                arrayOfStartingValues.removeLast()
                break
            }
        }

        if let temporaryStringAsInt = Int(temporaryString) {
            arrayOfStartingValues.append(temporaryStringAsInt)
        }

        if arrayOfStartingValues.count < 4 || arrayOfStartingValues.isEmpty {
            completion(nil, false)
            return
        }

        completion(arrayOfStartingValues, true)
    }

    func validateInputtedCommands(inputtedCommands: String?, completion: (_ commandsAsArray: [Int]?, _ correctInput: Bool ) -> ()) {
        #warning("rename variable and write generic code function")
        guard let safeCommands = inputtedCommands else {
            completion(nil, false)
            return
        }

        if safeCommands.isEmpty {
            completion(nil, false)
            return
        }

        let filteredString = safeCommands.filter { "01234".contains($0) }

        completion(convertStringIntoArrayOfInts(stringToConvert: filteredString), true)
    }
}

private extension InputValidator {

    #warning("Add documentation that explains that this can actually take 01 as a valid input or 1929100111000")
    func convertStringIntoArrayOfInts(stringToConvert: String) -> [Int]? {
        return stringToConvert.compactMap { $0.wholeNumberValue }
    }
}

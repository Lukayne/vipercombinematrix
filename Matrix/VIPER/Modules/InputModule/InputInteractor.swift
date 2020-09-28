//
//  InputInteractor.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation
import Combine

class InputInteractor {
    weak var delegate: InputInteractorProtocol?

    private let inputValidator = InputValidator()

    let model: MatrixDataModel
    
    init(model: MatrixDataModel) {
        self.model = model
    }

    func validateStartingInput(startingInput: String?) {
        inputValidator.validateStartingInput(startingInputData: startingInput) { (validatedInput, wasInputInAValidFormat) in
            if !wasInputInAValidFormat {
                delegate?.didValidateStarterValues(success: wasInputInAValidFormat)
                return
            }

            guard let validatedInput = validatedInput else {
                delegate?.didValidateStarterValues(success: false)
                return
            }

            #warning("Get back to this.")
            if validatedInput.count >= 4 {
                model.matrix.matrixSize.width = validatedInput[0]
                model.matrix.matrixSize.height = validatedInput[1]

                model.matrix.pointer.positionX = validatedInput[2]
                model.matrix.pointer.positionY = validatedInput[3]

                delegate?.didValidateStarterValues(success: wasInputInAValidFormat)
            } else {
                delegate?.didValidateStarterValues(success: false)
            }
        }
    }

    func validateCommands(commands: String?) {
        inputValidator.validateInputtedCommands(inputtedCommands: commands) { (validatedCommands, wasInputInAValidFormat) in
            if !wasInputInAValidFormat {
                delegate?.didValidateCommands(success: wasInputInAValidFormat)
            }

            guard let validatedCommands = validatedCommands else {
                delegate?.didValidateCommands(success: false)
                return
            }

            model.matrix.commands.commands = validatedCommands

            delegate?.didValidateCommands(success: true)
        }
    }
}

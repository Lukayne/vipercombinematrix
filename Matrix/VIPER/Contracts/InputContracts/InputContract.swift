//
//  InputContract.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation

protocol InputInteractorProtocol: class {
    func didValidateStarterValues(success: Bool)
    func didValidateCommands(success: Bool)
}

protocol InputPresenterProtocol: class {
    func showErrorAndAskForStartingInput(errorMessage: String)
    func showCorrectStartingValuesMessage(message: String)
    func askForCommands(message: String)
    func showErrorAndAskForCommands(errorMessage: String)
    #warning("Document why this is needed.")
    func makeGameView()
}

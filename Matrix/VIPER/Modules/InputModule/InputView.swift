//
//  StarterView.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import SwiftUI
import Combine

class InputView: NSObject {
    @ObservedObject var presenter: InputPresenter
    #warning("Add documentation to why I'm not using the @EnvironmentObject")
//    @EnvironmentObject var model: MatrixDataModel

    private let startingInputData: String?

    init(startingInputData: String?, matrixDataModel: MatrixDataModel) {
        self.startingInputData = startingInputData
        self.presenter = InputPresenter(interactor: InputInteractor(model: matrixDataModel))
        super.init()
        self.presenter.delegate = self
        self.presenter.updateWithStartingInput(startingInput: startingInputData)
    }
}

extension InputView: InputPresenterProtocol {

    func showErrorAndAskForStartingInput(errorMessage: String) {
        print(errorMessage)
        let startingInput = readLine()
        presenter.updateWithStartingInput(startingInput: startingInput)
    }

    func showCorrectStartingValuesMessage(message: String) {
        print(message)
    }

    func showErrorAndAskForCommands(errorMessage: String) {
        print(errorMessage)
        let receivedCommands = readLine()
        presenter.updateWithCommands(commands: receivedCommands)
    }

    func askForCommands(message: String) {
        print(message)
        let receivedCommands = readLine()
        presenter.updateWithCommands(commands: receivedCommands)
    }

    func makeGameView() {
        _ = presenter.makeGameView()
    }
}

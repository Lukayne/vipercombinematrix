//
//  InputPresenter.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import SwiftUI
import Combine

class InputPresenter: ObservableObject {
    @Published var matrix: Matrix = Matrix()

    weak var delegate: InputPresenterProtocol?

    private let interactor: InputInteractor
    private var cancellables = Set<AnyCancellable>()
    private let router = InputRouter()

    init(interactor: InputInteractor) {
        self.interactor = interactor

        self.interactor.delegate = self

        interactor.model.$matrix
            .assign(to: \.matrix, on: self)
            .store(in: &cancellables)
    }

    func updateWithStartingInput(startingInput: String?) {
        interactor.validateStartingInput(startingInput: startingInput)
    }

    func updateWithCommands(commands: String?) {
        interactor.validateCommands(commands: commands)
    }

    #warning("Add documentation")
    func makeGameView() -> GameView {
        router.makeGameView(model: interactor.model)
        
    }
}

extension InputPresenter: InputInteractorProtocol {
    func didValidateStarterValues(success: Bool) {
        if !success {
            delegate?.showErrorAndAskForStartingInput(errorMessage: Constants.GameInformation.errorInputMessage)
            return
        }

        delegate?.showCorrectStartingValuesMessage(message: Constants.GameInformation.correctStartingData(matrix: matrix))
        delegate?.askForCommands(message: Constants.GameInformation.commandsMessage)
    }

    func didValidateCommands(success: Bool) {
        success ? delegate?.makeGameView() : delegate?.showErrorAndAskForCommands(errorMessage: Constants.GameInformation.errorInputMessage)
    }
}

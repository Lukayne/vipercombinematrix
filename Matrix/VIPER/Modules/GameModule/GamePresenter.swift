//
//  GamePresenter.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import SwiftUI
import Combine

class GamePresenter: ObservableObject {
    @Published var matrix: Matrix = Matrix()
    @Published var pointer: Pointer = Pointer()

    #warning("Add documentation for why it's binding.")
    let setPointer: Binding<Pointer>

    weak var delegate: GamePresenterProtocol?

    private let interactor: GameInteractor
    private var cancellables = Set<AnyCancellable>()

    init(interactor: GameInteractor) {
        self.interactor = interactor

        #warning("Add documentation for what it does")
        setPointer = Binding<Pointer>(
            get: { interactor.pointer },
            set: { interactor.setNewPosition($0) }
        )

        self.interactor.delegate = self

        interactor.model.$matrix
            .assign(to: \.matrix, on: self)
            .store(in: &cancellables)

        interactor.pointerPublisher
          .assign(to: \.pointer, on: self)
          .store(in: &cancellables)
    }

    func makeGameView() {
        #warning("Add documentation to why you are just starting the game.")
        interactor.startGame()
    }
}

extension GamePresenter: GameInteractorProtocol {
    #warning("Add documentaiton for why I'm not acting on this at the moment")
    func isValidMatrixSize(isValid: Bool) {
    }


    func gameDidFinish(endPosition: Pointer, success: Bool) {
        success ? delegate?.showGameResult(gameResult: Constants.statusCodes.successMessage(endPositionX: matrix.pointer.positionX, endPositionY: matrix.pointer.positionY)) : delegate?.showGameResult(gameResult: Constants.statusCodes.errorMessage)
    }
}

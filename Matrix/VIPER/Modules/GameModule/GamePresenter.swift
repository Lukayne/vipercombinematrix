//
//  GamePresenter.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import SwiftUI
import Combine

class GamePresenter: ObservableObject {
    @Published var pointer: Pointer = Pointer()
    @Published var occupiedCell: MatrixCell = MatrixCell()
    @Published var matrixGrid: [[MatrixCell]] = [[]]

    weak var delegate: GamePresenterProtocol?

    private let interactor: GameInteractor
    private var cancellables = Set<AnyCancellable>()

    init(interactor: GameInteractor) {
        self.interactor = interactor
        self.interactor.delegate = self

        interactor.pointerPublisher
          .assign(to: \.pointer, on: self)
          .store(in: &cancellables)

        interactor.occupiedCellPublisher
            .assign(to: \.occupiedCell, on: self)
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
        success ? delegate?.showGameResult(gameResult: Constants.statusCodes.successMessage(endPositionX: pointer.positionX, endPositionY: pointer.positionY)) : delegate?.showGameResult(gameResult: Constants.statusCodes.errorMessage)
    }
}

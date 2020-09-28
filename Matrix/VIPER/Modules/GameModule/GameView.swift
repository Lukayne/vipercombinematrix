//
//  GameView.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Combine
import SwiftUI

class GameView: NSObject {
    @ObservedObject var presenter: GamePresenter

    init(presenter: GamePresenter) {
        self.presenter = presenter
        super.init()
        self.presenter.delegate = self

        self.presenter.makeGameView()
    }
}

extension GameView: GamePresenterProtocol {
    func showGameResult(gameResult: String) {
        print(gameResult)
    }
}

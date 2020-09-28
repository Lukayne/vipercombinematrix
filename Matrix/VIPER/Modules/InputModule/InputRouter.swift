//
//  InputRouter.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

class InputRouter {
  func makeGameView(model: MatrixDataModel) -> GameView {
    #warning("Add documentation to why this is not really working as a intended router..")
    let presenter = GamePresenter(interactor: GameInteractor(model: model))
    return GameView(presenter: presenter)
  }
}

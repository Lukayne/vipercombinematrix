//
//  GameContract.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Foundation

protocol GameInteractorProtocol: class {
    func isValidMatrixSize(isValid: Bool)
    func gameDidFinish(endPosition: Pointer, success: Bool)
}

protocol GamePresenterProtocol: class {
    func showGameResult(gameResult: String)
}

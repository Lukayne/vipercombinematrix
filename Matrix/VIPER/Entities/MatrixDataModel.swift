//
//  MatrixDataModel.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Combine

final class MatrixDataModel {
    @Published var matrix = Matrix()
    @Published var occupiedCell = MatrixCell()
    @Published var matrixGrid: [[MatrixCell]] = [[]]

    private var cancellables = Set<AnyCancellable>()
}

extension MatrixDataModel: ObservableObject { }

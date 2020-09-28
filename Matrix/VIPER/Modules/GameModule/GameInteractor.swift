//
//  GameInteractor.swift
//  Matrix
//
//  Created by Richard Smith on 2020-09-27.
//

import Combine

class GameInteractor {
    private let model: MatrixDataModel
    private let matrix: Matrix
    private let matrixSize: MatrixSize
    private let commands: Commands
    private var direction: Direction
    private var directionAsInt = 0
    private var cancellables = Set<AnyCancellable>()

    weak var delegate: GameInteractorProtocol?

    #warning("Add documentation to what this does.")
    var pointer: Pointer { matrix.pointer }
    var pointerPublisher: Published<Pointer>.Publisher { matrix.$pointer }

    var occupiedCell: MatrixCell { model.occupiedCell }
    var occupiedCellPublisher: Published<MatrixCell>.Publisher { model.$occupiedCell }

    #warning("Add documentation to why these are @Published")
    @Published var matrixGrid: [[MatrixCell]] = [[]]
    
    init(model: MatrixDataModel) {
        self.model = model
        self.matrix = model.matrix
        self.matrixSize = model.matrix.matrixSize
        self.commands = model.matrix.commands
        self.direction = model.matrix.direction
    }

    #warning("Rewrite into several functions when you adapt it for SwiftUI")
    func startGame() {
        #warning("Document why the user isn't being redirected in the sense of the view")
        guard let matrixGrid = createMatrix() else {
            delegate?.isValidMatrixSize(isValid: false)
            return
        }

        self.matrixGrid = matrixGrid
        delegate?.isValidMatrixSize(isValid: true)

        executeCommands(commands: commands)
    }
}

private extension GameInteractor {

    func createMatrix() -> [[MatrixCell]]?  {
        let width = matrixSize.width
        var height = matrixSize.height

        #warning("Add documentation to why height can be 0")
        if width <= 0 || height < 0 {
            return nil
        }

        #warning("Add documentation for why you are doing this.")
        if height == 0 {
            height = 1
        }

        #warning("Add docs to why you are doing this.")
        occupiedCell.cellX = pointer.positionX
        occupiedCell.cellY = pointer.positionY


        #warning("Add documentation to why height can be 0")
        if width <= 0 || height < 0 {
            return nil
        }

        #warning("Add documentation for why you are doing this.")
        if height == 0 {
            height = 1
        }

        var x = 0
        var y = 0

        #warning("find a better solution to -1")
        for _ in 0...height-1 {
            var columnArray = Array<MatrixCell>()
            for _ in 0...width-1 {
                let origo = MatrixCell()
                origo.cellX = x
                origo.cellY = y
                columnArray.append(origo)
                x += 1
            }
            y += 1
            matrixGrid.append(columnArray)
            x = 0
        }

        return self.matrixGrid
    }

    #warning("Try to rewrite into generic function.")
    func movePointer(currentPosition: Pointer, occupiedCell: MatrixCell, direction: Direction, moveForwards: Bool) {
        #warning("Add documentation to why you allow invalid moves.")

        switch direction {
        case .north:
            pointer.positionY = moveForwards ? currentPosition.positionY-1 : currentPosition.positionY+1
            occupiedCell.cellY = moveForwards ? occupiedCell.cellY-1 : occupiedCell.cellY+1
            break
        case .east:
            pointer.positionX = moveForwards ? currentPosition.positionX+1 : currentPosition.positionX-1
            occupiedCell.cellX = moveForwards ? occupiedCell.cellX+1 : occupiedCell.cellX-1
            break
        case .south:
            pointer.positionY = moveForwards ? currentPosition.positionY+1 : currentPosition.positionY-1
            occupiedCell.cellY = moveForwards ? occupiedCell.cellY+1 : occupiedCell.cellY-1
            break
        case .west:
            pointer.positionX = moveForwards ? currentPosition.positionX-1 : currentPosition.positionX+1
            occupiedCell.cellX = moveForwards ? occupiedCell.cellX-1 : occupiedCell.cellX+1
            break
        }
    }

    func executeCommands(commands: Commands) {
        for command in commands.commands {
            guard let commandToExecute = GameCommands(rawValue: command) else {
                delegate?.gameDidFinish(endPosition: pointer, success: false)
                return
            }
            executeCommand(command: commandToExecute)

            if commandToExecute.rawValue == 0 {
                break
            }
        }
    }

    func executeCommand(command: GameCommands) {
        switch command {
        case .quit:
            delegate?.gameDidFinish(endPosition: pointer, success: self.isValidPosition(occupiedCell: occupiedCell))
            break
        case .moveForwards:
            movePointer(currentPosition: pointer, occupiedCell: occupiedCell, direction: direction, moveForwards: true)
            break
        case .moveBackwards:
            movePointer(currentPosition: pointer, occupiedCell: occupiedCell, direction: direction, moveForwards: false)
            break
        case .rotatePointerDirectionClockwise:
            rotatePointerDirection(currentDirection: direction, isClockwise: true)
            break
        case .rotatePointerDirectionCounterClockwise:
            rotatePointerDirection(currentDirection: direction, isClockwise: false)
            break
        }
    }

    func rotatePointerDirection(currentDirection: Direction, isClockwise: Bool) {
        let directionAsInt = currentDirection.rawValue

        if directionAsInt == 270 && isClockwise {
            self.direction = Direction.north
            return
        }

        if directionAsInt == 0 && !isClockwise {
            self.direction = Direction.west
            return
        }


        let newDirectionAsInt = isClockwise ? directionAsInt+90 : directionAsInt-90

        if let newDirection = Direction(rawValue: newDirectionAsInt) {
            self.direction = newDirection
        }
    }

    /// Calls bar with "Hello, world"
    /// - parameter bar: A closure to call
    /// - parameter theString: A string to use
    func isValidPosition(occupiedCell: MatrixCell) -> Bool {

        #warning("Add documentation for what is occuring")
        let oneDimensionalMatrix = matrixGrid.flatMap( {$0} )

        let filtered1DMatrix = oneDimensionalMatrix.filter({
            $0.cellX == occupiedCell.cellX && $0.cellY == occupiedCell.cellY
        })

        return !filtered1DMatrix.isEmpty
    }
}

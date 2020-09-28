import Foundation

#warning("Add documentation regarding what .main does.")
func start() {
    let matrix = MatrixDataModel()
    print(Constants.GameInformation.openingMessage)
    print(Constants.GameInformation.messageForFirstInput)
    let startingInputData = readLine()
    let starter = InputView(startingInputData: startingInputData, matrixDataModel: matrix)
}

start()

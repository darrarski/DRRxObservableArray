enum ObservableArrayChangeEvent<T> {
    case inserted(indices: [Int], elements: [T])
    case deleted(indices: [Int], elements: [T])
    case updated(indices: [Int], oldElements: [T], newElements: [T])
}

extension ObservableArrayChangeEvent where T: Equatable {

    static func ==(lhs: ObservableArrayChangeEvent<T>, rhs: ObservableArrayChangeEvent<T>) -> Bool {
        switch (lhs, rhs) {
        case (.inserted(let indicesLeft, let elementsLeft),
              .inserted(let indicesRight, let elementsRight)),
             (.deleted(let indicesLeft, let elementsLeft),
              .deleted(let indicesRight, let elementsRight)):
            return indicesLeft == indicesRight &&
                   elementsLeft == elementsRight

        case (.updated(let indicesLeft, let oldElementsLeft, let newElementsLeft),
              .updated(let indicesRight, let oldElementsRight, let newElementsRight)):
            return indicesLeft == indicesRight &&
                   oldElementsLeft == oldElementsRight &&
                   newElementsLeft == newElementsRight

        default:
            return false
        }
    }

}

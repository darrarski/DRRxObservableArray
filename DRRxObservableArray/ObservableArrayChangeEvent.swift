/// Event emitted by ObservableArray when its content changes
///
/// - inserted: emitted when elements are inserted
/// - deleted: emitted when elements are removed
/// - updated: emitted when elements are updated
public enum ObservableArrayChangeEvent<T> {
    case inserted(indices: [Int], elements: [T])
    case deleted(indices: [Int], elements: [T])
    case updated(indices: [Int], oldElements: [T], newElements: [T])
}

/// ObservableArrayChangeEvent cases are equatable when generic type of element 
/// inside ObservableArray which produces them is equatable
///
/// - Parameters:
///   - lhs: left case
///   - rhs: right case
/// - Returns: true if cases are equal
public func ==<T: Equatable>(lhs: ObservableArrayChangeEvent<T>, rhs: ObservableArrayChangeEvent<T>) -> Bool {
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

/// Arrays of ObserbaleArrayChangeEvent cases are equatable when generic type of
/// element inside ObservableArray which produces them is equatable
///
/// - Parameters:
///   - lhs: left array
///   - rhs: right array
/// - Returns: true if arrays are equal
public func ==<T: Equatable>(lhs: [ObservableArrayChangeEvent<T>], rhs: [ObservableArrayChangeEvent<T>]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for index in lhs.startIndex..<lhs.endIndex {
        guard lhs[index] == rhs[index] else { return false }
    }
    return true
}

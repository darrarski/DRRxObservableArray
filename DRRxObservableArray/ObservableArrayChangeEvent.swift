enum ObservableArrayChangeEvent<T> {
    case inserted(indices: [Int], elements: [T])
    case deleted(indices: [Int], elements: [T])
    case updated(indices: [Int], oldElements: [T], newElements: [T])
}

extension ObservableArrayChangeEvent where T: Equatable {

    static func ==(lhs: ObservableArrayChangeEvent<T>, rhs: ObservableArrayChangeEvent<T>) -> Bool {
        return false
    }

}

enum ObservableArrayChangeEvent<T> {
    case inserted(indices: [Int], elements: [T])
    case deleted(indices: [Int], elements: [T])
    case updated(indices: [Int], oldElements: [T], newElements: [T])
}

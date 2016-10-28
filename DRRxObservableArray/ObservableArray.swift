struct ObservableArray<T> {

    private(set) var elements: [T]

    init(_ elements: [T] = []) {
        self.elements = elements
    }

    var count: Int {
        return elements.count
    }

    // MARK: Mutating

    mutating func append(_ element: T) {
        elements.append(element)
    }

    mutating func append(contentsOf newElements: [T]) {
        elements.append(contentsOf: newElements)
    }

    mutating func prepend(_ element: T) {
        let index = elements.startIndex
        elements.insert(element, at: index)
    }

}

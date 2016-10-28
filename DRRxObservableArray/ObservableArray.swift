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

    mutating func insert(_ element: T, at index: Int) {
        elements.insert(element, at: index)
    }

    mutating func removeFirst() -> T {
        return elements.removeFirst()
    }

    mutating func removeLast() -> T {
        return elements.removeLast()
    }

    mutating func remove(at index: Int) -> T {
        return elements.remove(at: index)
    }

    mutating func removeAll() {
        guard !elements.isEmpty else { return }
        elements.removeAll()
    }

    subscript(position: Int) -> T {
        get {
            return elements[position]
        }
        set {
            elements[position] = newValue
        }
    }

}

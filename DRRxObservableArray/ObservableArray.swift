struct ObservableArray<T> {

    private(set) var elements: [T]

    init(_ elements: [T] = []) {
        self.elements = elements
    }

}

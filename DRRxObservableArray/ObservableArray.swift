import RxSwift

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
        eventsSubject.onNext(.inserted(indices: [elements.count - 1], elements: [element]))
    }

    mutating func append(contentsOf newElements: [T]) {
        guard newElements.count > 0 else { return }
        let end = elements.count
        elements.append(contentsOf: newElements)
        eventsSubject.onNext(.inserted(indices: Array(end..<elements.count), elements: newElements))
    }

    mutating func prepend(_ element: T) {
        let index = elements.startIndex
        elements.insert(element, at: index)
        eventsSubject.onNext(.inserted(indices: [index], elements: [element]))
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

    // MARK: Observables

    private let eventsSubject = PublishSubject<ObservableArrayChangeEvent<T>>()

    var events: Observable<ObservableArrayChangeEvent<T>> { return eventsSubject }

}

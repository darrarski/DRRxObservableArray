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
        eventsSubject.onNext(.inserted(indices: [index], elements: [element]))
    }

    mutating func removeFirst() -> T {
        let index = elements.startIndex
        let element = elements.removeFirst()
        defer {
            eventsSubject.onNext(.deleted(indices: [index], elements: [element]))
        }
        return element
    }

    mutating func removeLast() -> T {
        let index = elements.endIndex - 1
        let element = elements.removeLast()
        defer {
            eventsSubject.onNext(.deleted(indices: [index], elements: [element]))
        }
        return element
    }

    mutating func remove(at index: Int) -> T {
        let element = elements.remove(at: index)
        defer {
            eventsSubject.onNext(.deleted(indices: [index], elements: [element]))
        }
        return element
    }

    mutating func removeAll() {
        guard !self.elements.isEmpty else { return }
        let elements = self.elements
        self.elements.removeAll()
        eventsSubject.onNext(.deleted(indices: Array(elements.startIndex..<elements.endIndex), elements: elements))
    }

    subscript(position: Int) -> T {
        get {
            return elements[position]
        }
        set {
            let oldElements = elements
            elements[position] = newValue
            eventsSubject.onNext(.updated(indices: [position],
                                          oldElements: [oldElements[position]],
                                          newElements: [newValue]))
        }
    }

    // MARK: Observables

    private let eventsSubject = PublishSubject<ObservableArrayChangeEvent<T>>()

    var events: Observable<ObservableArrayChangeEvent<T>> { return eventsSubject }

}

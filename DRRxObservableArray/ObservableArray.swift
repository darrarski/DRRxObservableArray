import RxSwift

/// ObservableArray of generic elements
public struct ObservableArray<T> {

    /// Contained elements
    public private(set) var elements: [T]

    /// Initialize ObservableArray with given elements
    ///
    /// - Parameter elements: elements
    public init(_ elements: [T] = []) {
        self.elements = elements
    }

    /// Count of elements in ObservableArray
    public var count: Int {
        return elements.count
    }

    // MARK: Mutating

    /// Append element to ObservableArray
    ///
    /// - Parameter element: element
    public mutating func append(_ element: T) {
        elements.append(element)
        eventsSubject.onNext(.inserted(indices: [elements.count - 1], elements: [element]))
    }

    /// Append multiple elements to ObservableArray
    ///
    /// - Parameter newElements: array of elements
    public mutating func append(contentsOf newElements: [T]) {
        guard newElements.count > 0 else { return }
        let end = elements.count
        elements.append(contentsOf: newElements)
        eventsSubject.onNext(.inserted(indices: Array(end..<elements.count), elements: newElements))
    }

    /// Prepend element to ObservableArray
    ///
    /// - Parameter element: element
    public mutating func prepend(_ element: T) {
        let index = elements.startIndex
        elements.insert(element, at: index)
        eventsSubject.onNext(.inserted(indices: [index], elements: [element]))
    }

    /// Insert element to ObservableArray at given index
    ///
    /// - Parameters:
    ///   - element: element
    ///   - index: index
    public mutating func insert(_ element: T, at index: Int) {
        elements.insert(element, at: index)
        eventsSubject.onNext(.inserted(indices: [index], elements: [element]))
    }

    /// Remove first element from ObservableArray
    ///
    /// - Returns: removed element
    public mutating func removeFirst() -> T {
        let index = elements.startIndex
        let element = elements.removeFirst()
        defer {
            eventsSubject.onNext(.deleted(indices: [index], elements: [element]))
        }
        return element
    }

    /// Remove last element from ObservableArray
    ///
    /// - Returns: removed element
    public mutating func removeLast() -> T {
        let index = elements.endIndex - 1
        let element = elements.removeLast()
        defer {
            eventsSubject.onNext(.deleted(indices: [index], elements: [element]))
        }
        return element
    }

    /// Remove element at index from ObservableArray
    ///
    /// - Parameter index: index
    /// - Returns: removed element
    public mutating func remove(at index: Int) -> T {
        let element = elements.remove(at: index)
        defer {
            eventsSubject.onNext(.deleted(indices: [index], elements: [element]))
        }
        return element
    }

    /// Remove all elements from ObservableArray
    public mutating func removeAll() {
        guard !self.elements.isEmpty else { return }
        let elements = self.elements
        self.elements.removeAll()
        eventsSubject.onNext(.deleted(indices: Array(elements.startIndex..<elements.endIndex), elements: elements))
    }

    /// Subscript element (get and set)
    ///
    /// - Parameter position: index
    public subscript(position: Int) -> T {
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

    /// Observable events emitted when content of ObservableArray changes
    public var events: Observable<ObservableArrayChangeEvent<T>> {
        return eventsSubject
    }

}

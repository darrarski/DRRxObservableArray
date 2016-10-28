import Nimble
import RxSwift
import RxTest

func equal<T: Equatable>(_ expectedValue: ObservableArrayChangeEvent<T>) -> MatcherFunc<ObservableArrayChangeEvent<T>> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "equal <\(expectedValue)>"
        if let actualValue = try actualExpression.evaluate() {
            return actualValue == expectedValue
        } else {
            return false
        }
    }
}

func equal<T: Equatable>(_ expectedValue: [Recorded<Event<ObservableArrayChangeEvent<T>>>]) -> MatcherFunc<[Recorded<Event<ObservableArrayChangeEvent<T>>>]> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "equal <\(expectedValue)>"
        if let actualValue = try actualExpression.evaluate() {
            return actualValue == expectedValue
        } else {
            return false
        }
    }
}

private func ==<T: Equatable>(lhs: [Recorded<Event<ObservableArrayChangeEvent<T>>>], rhs: [Recorded<Event<ObservableArrayChangeEvent<T>>>]) -> Bool {
    guard lhs.count == rhs.count else {
        return false
    }
    for i in lhs.startIndex..<lhs.endIndex {
        guard lhs[i] == rhs[i] else {
            return false
        }
    }
    return true
}

private func ==<T: Equatable>(lhs: Recorded<Event<ObservableArrayChangeEvent<T>>>, rhs: Recorded<Event<ObservableArrayChangeEvent<T>>>) -> Bool {
    return lhs.time == rhs.time && lhs.value == rhs.value
}

private func ==<T: Equatable>(lhs: Event<ObservableArrayChangeEvent<T>>, rhs: Event<ObservableArrayChangeEvent<T>>) -> Bool {
    switch (lhs, rhs) {
    case (.next(let leftValue), .next(let rightValue)):
        return leftValue == rightValue
    case (.error(let leftError), .error(let rightError)):
        return "\(leftError)" == "\(rightError)"
    case (.completed, .completed):
        return true
    default:
        return false
    }
}

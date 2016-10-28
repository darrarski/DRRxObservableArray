import Nimble

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

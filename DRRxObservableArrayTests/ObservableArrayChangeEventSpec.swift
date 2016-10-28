import Quick
import Nimble
import RxSwift

class ObservableArrayChangeEventSpec: QuickSpec {

    override func spec() {
        describe("compare") {
            var event1: ObservableArrayChangeEvent<String>!
            var event2: ObservableArrayChangeEvent<String>!

            context("equal insertions") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.inserted(indices: [1, 2],
                                                                 elements: ["a", "b"])
                    event2 = ObservableArrayChangeEvent.inserted(indices: [1, 2],
                                                                 elements: ["a", "b"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should be equal") {
                    expect(event1).to(equal(event2))
                }
            }

            context("equal deletion") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.deleted(indices: [2, 3],
                                                                elements: ["b", "c"])
                    event2 = ObservableArrayChangeEvent.deleted(indices: [2, 3],
                                                                elements: ["b", "c"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should be equal") {
                    expect(event1).to(equal(event2))
                }
            }

            context("equal updates") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.updated(indices: [3, 4, 5],
                                                                oldElements: ["c", "d", "e"],
                                                                newElements: ["f", "g", "h"])
                    event2 = ObservableArrayChangeEvent.updated(indices: [3, 4, 5],
                                                                oldElements: ["c", "d", "e"],
                                                                newElements: ["f", "g", "h"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should be equal") {
                    expect(event1).to(equal(event2))
                }
            }

            context("nonequal insertions") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.inserted(indices: [1, 2],
                                                                 elements: ["a", "b"])
                    event2 = ObservableArrayChangeEvent.inserted(indices: [3, 4],
                                                                 elements: ["a", "b"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should not be equal") {
                    expect(event1).toNot(equal(event2))
                }
            }

            context("nonequal deletion") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.deleted(indices: [2],
                                                                elements: ["c"])
                    event2 = ObservableArrayChangeEvent.deleted(indices: [2, 3],
                                                                elements: ["b", "c"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should not be equal") {
                    expect(event1).toNot(equal(event2))
                }
            }

            context("nonequal updates") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.updated(indices: [3, 4, 5],
                                                                oldElements: ["c", "d", "e"],
                                                                newElements: ["f", "g", "h"])
                    event2 = ObservableArrayChangeEvent.updated(indices: [3, 4, 5],
                                                                oldElements: ["f", "g", "h"],
                                                                newElements: ["f", "g", "h"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should not be equal") {
                    expect(event1).toNot(equal(event2))
                }
            }

            context("different events") {
                beforeEach {
                    event1 = ObservableArrayChangeEvent.inserted(indices: [1, 2],
                                                                 elements: ["a", "b"])
                    event2 = ObservableArrayChangeEvent.deleted(indices: [1, 2],
                                                                elements: ["a", "b"])
                }

                afterEach {
                    event1 = nil
                    event2 = nil
                }

                it("should not be equal") {
                    expect(event1).toNot(equal(event2))
                }
            }
        }
    }

}

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

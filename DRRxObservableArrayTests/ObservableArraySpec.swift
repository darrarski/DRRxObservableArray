import Quick
import Nimble

class ObservableArraySpec: QuickSpec {

    override func spec() {
        describe("ObservableArray of Strings") {
            var sut: ObservableArray<String>!

            context("when initialized with array") {
                beforeEach {
                    sut = ObservableArray(["a", "b", "c"])
                }

                afterEach {
                    sut = nil
                }

                it("should have correct elements") {
                    expect(sut.elements).to(equal(["a", "b", "c"]))
                }

                it("should have correct count") {
                    expect(sut.count).to(equal(3))
                }

                context("when element appended") {
                    beforeEach {
                        sut.append("d")
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["a", "b", "c", "d"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(4))
                    }
                }

                context("when element prepended") {
                    beforeEach {
                        sut.prepend("d")
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["d", "a", "b", "c"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(4))
                    }
                }

                context("when elements appended") {
                    beforeEach {
                        sut.append(contentsOf: ["d", "e"])
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["a", "b", "c", "d", "e"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(5))
                    }
                }

                context("when element inserted at index") {
                    beforeEach {
                        sut.insert("d", at: 1)
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["a", "d", "b", "c"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(4))
                    }
                }

                context("when first element removed") {
                    var removedElement: String!

                    beforeEach {
                        removedElement = sut.removeFirst()
                    }

                    it("should remove correct element") {
                        expect(removedElement).to(equal("a"))
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["b", "c"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(2))
                    }
                }

                context("when last element removed") {
                    var removedElement: String!

                    beforeEach {
                        removedElement = sut.removeLast()
                    }

                    it("should remove correct element") {
                        expect(removedElement).to(equal("c"))
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["a", "b"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(2))
                    }
                }

                context("when element removed at index") {
                    var removedElement: String!

                    beforeEach {
                        removedElement = sut.remove(at: 1)
                    }

                    it("should remove correct element") {
                        expect(removedElement).to(equal("b"))
                    }

                    it("should have correct elements") {
                        expect(sut.elements).to(equal(["a", "c"]))
                    }

                    it("should have correct count") {
                        expect(sut.count).to(equal(2))
                    }
                }
            }
        }
    }

}

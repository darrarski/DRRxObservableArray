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
            }
        }
    }

}

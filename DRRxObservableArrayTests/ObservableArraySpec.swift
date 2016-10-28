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
            }
        }
    }

}

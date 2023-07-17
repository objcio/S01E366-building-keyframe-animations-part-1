//

import XCTest
@testable import KeyframeReimplementation

final class KeyframeReimplementationTests: XCTestCase {
    func testExample() throws {
        var x = MyLinearKeyframe(to: 100 as CGFloat, duration: 2)
        XCTAssertEqual(x.interpolate(from: 0, time: 0.5), 25)
        XCTAssertEqual(x.interpolate(from: 0, time: 1), 50)
        XCTAssertEqual(x.interpolate(from: 0, time: 2), 100)
    }

    func testTrack() throws {
        let track = MyKeyframeTrack(keyPath: \.self, keyframes: [
            MyLinearKeyframe(to: 100, duration: 1),
            MyLinearKeyframe(to: 150, duration: 1)
        ])
        XCTAssertEqual(track.value(at: 0.5, initialValue: 0), 50)
        XCTAssertEqual(track.value(at: 1.5, initialValue: 0), 125)
        XCTAssertEqual(track.value(at: 3, initialValue: 0), 150)
    }
}

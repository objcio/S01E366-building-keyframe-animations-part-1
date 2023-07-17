//

import Foundation
import SwiftUI

struct MyKeyframeTrack<Root, Value: Animatable> {
    var keyPath: KeyPath<Root, Value>
    var keyframes: [MyLinearKeyframe<Value>]

    func value(at time: TimeInterval, initialValue: Value) -> Value {
        var currentTime: TimeInterval = 0
        var previousValue = initialValue
        for keyframe in keyframes {
            let relativeTime = time - currentTime
            defer { currentTime += keyframe.duration }
            guard relativeTime <= keyframe.duration else {
                previousValue = keyframe.to
                continue
            }

            return keyframe.interpolate(from: previousValue, time: relativeTime)
        }
        return keyframes.last?.to ?? initialValue
    }
}

struct MyLinearKeyframe<Value: Animatable> {
    var to: Value
    var duration: TimeInterval

    func interpolate(from: Value, time: TimeInterval) -> Value {
        let progress = time/duration
        var result = from
        result.animatableData.interpolate(towards: to.animatableData, amount: progress)
        return result
    }
}

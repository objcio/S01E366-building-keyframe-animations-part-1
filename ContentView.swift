//

import SwiftUI

struct ShakeData {
    var offset: CGFloat = 0
    var rotation: Angle = .zero
}

struct ContentView: View {
    @State private var shakes = 0

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Shake") {
                shakes += 1
            }
            .keyframeAnimator(initialValue: ShakeData(), trigger: shakes, content: { view, value in
                view
                    .offset(x: value.offset)
                    .rotationEffect(value.rotation)
            }, keyframes: { _ in
                KeyframeTrack(\.offset) {
                    CubicKeyframe(-30, duration: 0.5)
                    CubicKeyframe(30, duration: 1)
                    CubicKeyframe(0, duration: 0.5)
                }
                KeyframeTrack(\.rotation) {
                    CubicKeyframe(.degrees(30), duration: 1)
                    CubicKeyframe(.zero, duration: 1)
                }
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

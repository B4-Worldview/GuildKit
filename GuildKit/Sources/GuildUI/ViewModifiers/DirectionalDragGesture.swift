//
//  DirectionalDragGesture.swift
//  GuildKit
//
//  Created by Jevon Charles on 1/20/21.
//

import SwiftUI

struct DirectionalDragGesture: ViewModifier {
	@Binding var isPressed: Bool
	@Binding var isOn: Bool

	func body(content: Content) -> some View {
		content
			.gesture(
				DragGesture(minimumDistance: 20)
					.onEnded { value in
						if (value.location.x - value.startLocation.x) > 0 && !isOn {
							isOn.toggle()
							isPressed.toggle()
							print("Right")
						} else if (value.location.x - value.startLocation.x) < 0 && isOn {
							isOn.toggle()
							isPressed.toggle()
							print("Left")
						}
					}
			)
	}
}

extension View {
	func directionalDrag(isPressed: Binding<Bool>, isOn: Binding<Bool>) -> some View {
		modifier(DirectionalDragGesture(isPressed: isPressed, isOn: isOn))
	}
}

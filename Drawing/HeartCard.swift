//
//  HeartCard.swift
//  Drawing
//
//  Created by Taras Kyparenko on 30/4/2023.
//

import SwiftUI

struct HeartCardV: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + 50, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - 50, y: rect.midY))
            path.addLine(to: CGPoint(x: 0, y: rect.midY))
            path.closeSubpath()
        }
    }
}

struct HeartCard: View {
    var body: some View {
        VStack {
                HeartCardV()
                .fill(.blue)
        }
    }
}

struct HeartCard_Previews: PreviewProvider {
    static var previews: some View {
        HeartCard()
    }
}

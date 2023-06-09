//
//  ContentView.swift
//  Drawing
//
//  Created by Taras Kyparenko on 27/4/2023.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
     var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<100) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct ContentView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct Flower: Shape {
//    // How much to move this petal away from the center
//    var petalOffset: Double = -20
//
//    //    How wide to make each petal
//    var petalWidth: Double = 100
//
//    func path(in rect: CGRect) -> Path {
//        //        The path that will hold all petals
//        var path = Path()
//
//        //        Count from 0 up to pi * 2, moving up pi / 8 each time
//        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
//            //            Rotate the petal by the current value of our loop
//            let rotation = CGAffineTransform(rotationAngle: number)
//
//            //            Move the petal to be at the center of view
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            //             Create a path for this petal using our properties plus a fixed Y and height
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//
//            //            Apply our rotation/position transformation to the petal
//            let rotatedPetal = originalPetal.applying(position)
//
//            //            Add it to our main path back
//            path.addPath(rotatedPetal)
//        }
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .fill(.yellow, style: FillStyle(eoFill: true))
//                .border(.blue, width: 2)
////                .stroke(.orange, lineWidth: 1)
//
//            Slider(value: $petalOffset, in: -40...40)
//                .padding(.horizontal)
//
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
////            Stepper("Petal Offset", value: $petalOffset, in: -40...40)
////                .padding(.horizontal)
////
////            Stepper("Petal Width", value: $petalOffset, in: 0...100)
////                .padding(.horizontal)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
////struct Triangle: Shape {
////    func path(in rect: CGRect) -> Path {
////
////        var path = Path()
////
////        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
////        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
////        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
////        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
////
////        return path
////    }
////}
////
////struct Arc: InsettableShape {
////    let startAngle : Angle
////    let endAngle: Angle
////    let clockwise: Bool
////    var insetAmount = 0.0
////
////    func path(in rect: CGRect) -> Path {
////        let rotationAdjustment = Angle.degrees(90)
////        let modifiedStart = startAngle - rotationAdjustment
////        let modifiedEnd = endAngle - rotationAdjustment
////
////        var path = Path()
////
////        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
////
////        return path
////    }
////
////    func inset(by amount: CGFloat) -> some InsettableShape {
////        var arc = self
////        arc.insetAmount += amount
////        return arc
////    }
////}
////
////struct ContentView: View {
////    var body: some View {
////        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
////            .strokeBorder(.yellow, lineWidth: 10)
////
//////        Circle()
//////            .strokeBorder(.yellow, lineWidth: 10)
////////        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
////////            .stroke(.yellow, lineWidth: 10)
////////            .frame(width: 300, height: 300)
//////////       Triangle()
//////////            .fill(.red)
//////////            .frame(width: 300, height: 300)
////    }
////}
//////struct ContentView: View {
//////    var body: some View {
//////        Path  { path in
//////            path.move(to: CGPoint(x: 200, y: 100))
//////            path.addLine(to: CGPoint(x: 100, y: 300))
//////            path.addLine(to: CGPoint(x: 300, y: 300))
//////            path.addLine(to: CGPoint(x: 200, y: 100))
//////            path.closeSubpath()
//////        }
//////        .stroke(.yellow, style: StrokeStyle(lineWidth: 20, lineCap:  .round, lineJoin: .round))
//////    }
//////}
//////
//////struct ContentView_Previews: PreviewProvider {
//////    static var previews: some View {
//////        ContentView()
//////    }
//////}

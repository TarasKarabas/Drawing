//
//  ContentView.swift
//  Drawing
//
//  Created by Taras Kyparenko on 27/4/2023.
//

import SwiftUI

struct HeartCardView: Shape {
    var tailWidthSize = 0.3
    
    var animatableData: Double {
        get { tailWidthSize }
        set { tailWidthSize = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width * tailWidthSize
        
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY - 40))
            path.addCurve(to: CGPoint(x: rect.midX - 100, y: rect.midY - 40), control1: CGPoint(x: rect.midX - 90, y: rect.midY + 100), control2: CGPoint(x: rect.midX - 170, y: rect.midY - 10))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY - 20), control: CGPoint(x: rect.midX - 65, y: rect.midY - 60))
            //    brush
            path.addQuadCurve(to: CGPoint(x: rect.midX - width, y: rect.midY - 110), control: CGPoint(x: rect.midX, y: rect.midY - 60))
            path.addLine(to: CGPoint(x: rect.midX + width, y: rect.midY - 110))
            
            //    brush
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY - 20), control: CGPoint(x: rect.midX, y: rect.midY - 60))
            path.addQuadCurve(to: CGPoint(x: rect.midX + 100, y: rect.midY - 40), control: CGPoint(x: rect.midX + 65, y: rect.midY - 60))
            path.addCurve(to: CGPoint(x: rect.midX, y: rect.maxY - 40), control1: CGPoint(x: rect.midX + 170, y: rect.midY - 10), control2: CGPoint(x: rect.midX + 90, y: rect.midY + 100))
            
            path.closeSubpath()
        }
    }
}

struct ContentView: View {
    
    @State private var tailWidthSize = 0.3
   
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("\(Image(systemName: "heart.fill"))A")
                            .padding(.all, 20)
                            .font(.system(size: 60))
                            .foregroundColor(tailWidthSize == 0.0 ? Color.red : Color.black)
                    }
                }
                
                VStack {
                    HeartCardView(tailWidthSize: tailWidthSize)
                        .fill(tailWidthSize == 0.0 ? Color.red : Color.black)
                }
                .frame(width: 260, height: 340)
                HStack {
                    VStack {
                        Text("\(Image(systemName: "heart.fill"))A")
                            .padding(.all, 20)
                            .font(.system(size: 60))
                            .foregroundColor(tailWidthSize == 0.0 ? Color.red : Color.black)
                            
                    }
                    Spacer()
                }
            }
            .frame(width: 330, height: 550)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.bottom, 100)
            
            Slider(value: $tailWidthSize, in: 0.0...0.3) {
                
            }
            .padding(.top, 600)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Spirograph: Shape {
//    let innerRadius: Int
//    let outerRadius: Int
//    let distance: Int
//    let amount: Double
//
//    func gsd(_ a: Int, _ b: Int) -> Int {
//        var a = a
//        var b = b
//
//        while b != 0 {
//            let temp = b
//            b = a % b
//            a = temp
//        }
//        return a
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let divisor = gsd(innerRadius, outerRadius)
//
//        let outerRadius = Double(self.outerRadius)
//        let innerRadius = Double(self.innerRadius)
//        let distance = Double(self.distance)
//
//        let difference = innerRadius - outerRadius
//        let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
//
//        var path = Path()
//
//        for theta in stride(from: 0, through: endPoint, by: 0.01) {
//            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
//            var y = sin(theta) - distance * sin(difference / outerRadius * theta)
//
//            x += rect.width / 2
//            y += rect.height / 2
//
//            if theta == 0 {
//                path.move(to: CGPoint(x: x, y: y))
//            } else {
//                path.addLine(to: CGPoint(x: x, y: y))
//            }
//        }
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var innerRadius = 125.0
//    @State private var outerRadius = 75.0
//    @State private var distance = 25.0
//    @State private var amount = 1.0
//    @State private var hue = 0.6
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Spacer()
//
//            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
//                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
//                .frame(width: 300, height: 300)
//
//            Spacer()
//
//            Group {
//                Text("Inner Radius: \(Int(innerRadius))")
//                Slider(value: $innerRadius, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Outer Radius: \(Int(outerRadius))")
//                Slider(value: $outerRadius, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Distance: \(Int(distance))")
//                Slider(value: $distance, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
//                Slider(value: $amount)
//                    .padding([.horizontal, .bottom])
//
//                Text("Color")
//                Slider(value: $hue)
//                    .padding(.horizontal)
//            }
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
////struct Checkerboard: Shape {
////    var rows: Int
////    var columns: Int
////
////    var animatableData: AnimatablePair<Double, Double> {
////        get {
////            AnimatablePair(Double(rows), Double(columns))
////        }
////        set {
////            rows = Int(newValue.first)
////            columns = Int(newValue.second)
////        }
////    }
////
////    func path(in rect: CGRect) -> Path {
////        var path = Path()
////
////        let rowSize = rect.height / Double(rows)
////        let columnSize = rect.height / Double(columns)
////
////        for row in 0..<rows {
////            for column in 0..<columns {
////                if (row + column).isMultiple(of: 2) {
////                    let startX = columnSize * Double(column)
////                    let startY = rowSize * Double(row)
////
////                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
////                    path.addRect(rect)
////                }
////            }
////        }
////
////        return path
////    }
////}
////
////struct ContentView: View {
////    @State private var rows = 4
////    @State private var columns = 4
////
////    var body: some View {
////     Checkerboard(rows: rows, columns: columns)
////            .onTapGesture {
////                withAnimation(.linear(duration: 3)) {
////                    rows = 8
////                    columns = 16
////                }
////            }
////    }
////}
////
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
////
//////struct Trapezoid: Shape {
//////    var insetAmount: Double
//////
//////    var animatableData: Double {
//////        get { insetAmount }
//////        set { insetAmount = newValue }
//////    }
//////
//////    func path(in rect: CGRect) -> Path {
//////        var path = Path()
//////
//////        path.move(to: CGPoint(x: 0, y: rect.maxY))
//////        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//////        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//////        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//////        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//////
//////        return path
//////    }
//////}
//////
//////struct ContentView: View {
//////    @State private var insetAmount = 50.0
//////
//////    var body: some View {
//////      Trapezoid(insetAmount: insetAmount)
//////            .frame(width: 200, height: 100)
//////            .onTapGesture {
//////                withAnimation {
//////                    insetAmount = Double.random(in: 1...100)
//////                }
//////            }
//////    }
//////}
//////
//////struct ContentView_Previews: PreviewProvider {
//////    static var previews: some View {
//////        ContentView()
//////    }
//////}
//////
//////
////////struct ColorCyclingCircle: View {
////////    var amount = 0.0
////////     var steps = 100
////////
////////    var body: some View {
////////        ZStack {
////////            ForEach(0..<100) { value in
////////                Circle()
////////                    .inset(by: Double(value))
////////                    .strokeBorder(
////////                        LinearGradient(
////////                            gradient: Gradient(colors: [
////////                                color(for: value, brightness: 1),
////////                                color(for: value, brightness: 0.5)
////////                            ]),
////////                            startPoint: .top,
////////                            endPoint: .bottom
////////                        ),
////////                        lineWidth: 2
////////                    )
////////            }
////////        }
////////        .drawingGroup()
////////    }
////////
////////    func color(for value: Int, brightness: Double) -> Color {
////////        var targetHue = Double(value) / Double(steps) + amount
////////        if targetHue > 1 {
////////            targetHue -= 1
////////        }
////////        return Color(hue: targetHue, saturation: 1, brightness: brightness)
////////    }
////////}
////////
////////
////////struct ContentView: View {
////////    @State private var colorCycle = 0.0
////////
////////    var body: some View {
////////        VStack {
////////            ColorCyclingCircle(amount: colorCycle)
////////                .frame(width: 300, height: 300)
////////
////////            Slider(value: $colorCycle)
////////        }
////////    }
////////}
////////
////////struct ContentView_Previews: PreviewProvider {
////////    static var previews: some View {
////////        ContentView()
////////    }
////////}
////////
////////
//////////struct Flower: Shape {
//////////    // How much to move this petal away from the center
//////////    var petalOffset: Double = -20
//////////
//////////    //    How wide to make each petal
//////////    var petalWidth: Double = 100
//////////
//////////    func path(in rect: CGRect) -> Path {
//////////        //        The path that will hold all petals
//////////        var path = Path()
//////////
//////////        //        Count from 0 up to pi * 2, moving up pi / 8 each time
//////////        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
//////////            //            Rotate the petal by the current value of our loop
//////////            let rotation = CGAffineTransform(rotationAngle: number)
//////////
//////////            //            Move the petal to be at the center of view
//////////            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//////////
//////////            //             Create a path for this petal using our properties plus a fixed Y and height
//////////            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//////////
//////////            //            Apply our rotation/position transformation to the petal
//////////            let rotatedPetal = originalPetal.applying(position)
//////////
//////////            //            Add it to our main path back
//////////            path.addPath(rotatedPetal)
//////////        }
//////////        return path
//////////    }
//////////}
//////////
//////////struct ContentView: View {
//////////    @State private var petalOffset = -20.0
//////////    @State private var petalWidth = 100.0
//////////
//////////    var body: some View {
//////////        VStack {
//////////            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//////////                .fill(.yellow, style: FillStyle(eoFill: true))
//////////                .border(.blue, width: 2)
////////////                .stroke(.orange, lineWidth: 1)
//////////
//////////            Slider(value: $petalOffset, in: -40...40)
//////////                .padding(.horizontal)
//////////
//////////            Slider(value: $petalWidth, in: 0...100)
//////////                .padding(.horizontal)
////////////            Stepper("Petal Offset", value: $petalOffset, in: -40...40)
////////////                .padding(.horizontal)
////////////
////////////            Stepper("Petal Width", value: $petalOffset, in: 0...100)
////////////                .padding(.horizontal)
//////////        }
//////////    }
//////////}
//////////
//////////struct ContentView_Previews: PreviewProvider {
//////////    static var previews: some View {
//////////        ContentView()
//////////    }
//////////}
//////////
////////////struct Triangle: Shape {
////////////    func path(in rect: CGRect) -> Path {
////////////
////////////        var path = Path()
////////////
////////////        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
////////////        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
////////////        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
////////////        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
////////////
////////////        return path
////////////    }
////////////}
////////////
////////////struct Arc: InsettableShape {
////////////    let startAngle : Angle
////////////    let endAngle: Angle
////////////    let clockwise: Bool
////////////    var insetAmount = 0.0
////////////
////////////    func path(in rect: CGRect) -> Path {
////////////        let rotationAdjustment = Angle.degrees(90)
////////////        let modifiedStart = startAngle - rotationAdjustment
////////////        let modifiedEnd = endAngle - rotationAdjustment
////////////
////////////        var path = Path()
////////////
////////////        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
////////////
////////////        return path
////////////    }
////////////
////////////    func inset(by amount: CGFloat) -> some InsettableShape {
////////////        var arc = self
////////////        arc.insetAmount += amount
////////////        return arc
////////////    }
////////////}
////////////
////////////struct ContentView: View {
////////////    var body: some View {
////////////        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
////////////            .strokeBorder(.yellow, lineWidth: 10)
////////////
//////////////        Circle()
//////////////            .strokeBorder(.yellow, lineWidth: 10)
////////////////        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
////////////////            .stroke(.yellow, lineWidth: 10)
////////////////            .frame(width: 300, height: 300)
//////////////////       Triangle()
//////////////////            .fill(.red)
//////////////////            .frame(width: 300, height: 300)
////////////    }
////////////}
//////////////struct ContentView: View {
//////////////    var body: some View {
//////////////        Path  { path in
//////////////            path.move(to: CGPoint(x: 200, y: 100))
//////////////            path.addLine(to: CGPoint(x: 100, y: 300))
//////////////            path.addLine(to: CGPoint(x: 300, y: 300))
//////////////            path.addLine(to: CGPoint(x: 200, y: 100))
//////////////            path.closeSubpath()
//////////////        }
//////////////        .stroke(.yellow, style: StrokeStyle(lineWidth: 20, lineCap:  .round, lineJoin: .round))
//////////////    }
//////////////}
//////////////
//////////////struct ContentView_Previews: PreviewProvider {
//////////////    static var previews: some View {
//////////////        ContentView()
//////////////    }
//////////////}

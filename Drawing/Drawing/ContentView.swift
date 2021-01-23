//
//  ContentView.swift
//  Drawing
//
//  Created by Jackson Barnes on 21/01/2021.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Drawing a triangle manually
//Path { path in
//    path.move(to: CGPoint(x:200, y: 100))
//    path.addLine(to: CGPoint(x: 100, y: 300))
//    path.addLine(to: CGPoint(x: 300, y: 300))
//    path.addLine(to: CGPoint(x: 200, y: 100))
//}
//.stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

// Using func to create triangle
//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//        return path
//    }
//}
//
////Triangle()
////    .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
////    .frame(width: 300, height: 300)

// Using Struct and func to create an arc shape however we want
//struct Arc: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//        return path
//    }
//}
//
//Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//    .stroke(Color.blue, lineWidth: 10)
//    .frame(width: 300, height: 300)

//struct Arc: InsettableShape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//    var insetAmount: CGFloat = 0
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//        return path
//    }
//
//    func inset(by amount: CGFloat) -> some InsettableShape {
//    var arc = self
//    arc.insetAmount += amount
//    return arc
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
//            .strokeBorder(Color.blue, lineWidth: 40)
//    }
//}

//Drawing a 16 elipses and positioning them around a centre point with sliders to alter the appeareance

//struct Flower: Shape {
//    var petalOffset: Double = -20
//    var petalWidth: Double = 100
//
//    func path(in rect: CGRect) -> Path{
//        var path = Path()
//
//        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8){
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//        }
//        return path
//    }
//}
//
//
//struct ContentView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .fill(Color.red, style: FillStyle(eoFill: true))
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
//        }
//    }
//}

// Rainbow circle with slider, using DrawingGroup() to maintain performance
//struct ColorCyclingCircle: View {
//    var amount = 0.0
//    var steps = 100
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: CGFloat(value))
//                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1), self.color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
//            }
//        }
//        .drawingGroup()
//    }
//
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(self.steps) + self.amount
//
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}
//
//struct ContentView: View {
//    @State private var colorCycle = 0.0
//    var body: some View {
//        VStack {
//            ColorCyclingCircle(amount: self.colorCycle)
//                .frame(width: 300, height: 300)
//
//            Slider(value: $colorCycle)
//        }
//    }
//}

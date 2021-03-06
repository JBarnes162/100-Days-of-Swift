//
//  ContentView.swift
//  Animations
//
//  Created by Jackson Barnes on 03/01/2021.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                self.enabled.toggle()
                }
            }
            if enabled {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Button that grows and blurs as it is pressed
//Button("Tap me") {
//    self.animationAmount += 1
//}
//.padding(50)
//.background(Color.red)
//.foregroundColor(.white)
//.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//.scaleEffect(animationAmount)
//.blur(radius: (animationAmount - 1) * 3)
//.animation(.default)

//Button with pulsating circle around the button
//Button("Tap me") {
//    //self.animationAmount += 1
//}
//.padding(50)
//.background(Color.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.overlay(
//    Circle()
//        .stroke(Color.red)
//        .scaleEffect(animationAmount)
//        .opacity(Double(2-animationAmount))
//        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
//        )
//.onAppear {
//    self.animationAmount = 2
//}

// Animating the circle with a stepper
//print(animationAmount)
//
//
//return VStack {
//    Stepper("Scale amount", value: $animationAmount.animation(
//        Animation.easeInOut(duration: 1)
//            .repeatCount(3, autoreverses: true)
//    ), in: 1...10)
//
//    Spacer()
//
//    Button("Tap Me" ) {
//        self.animationAmount += 1
//    }
//    .padding(40)
//    .background(Color.red)
//    .foregroundColor(.white)
//    .clipShape(Circle())
//    .scaleEffect(animationAmount)
//}

// Rotating on an axis button when pressed

//Button("Tap me") {
//    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
//        self.animationAmount += 360
//    }
//}
//.padding(50)
//.background(Color.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))

// Animating both color change and shape change, order matters!!
//Button("Tap Me") {
//    self.enabled.toggle()
//}
//.frame(width: 200, height: 200)
//.background(enabled ? Color.blue : Color.red)
//.animation(.default)
//.foregroundColor(.white)
//.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//.animation(.interpolatingSpring(stiffness: 10, damping: 1))

// Dragging around an object on screen
//
//LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
//    .frame(width:300, height: 200)
//    .clipShape(RoundedRectangle(cornerRadius: 10))
//    .offset(dragAmount)
//    .gesture(
//    DragGesture()
//        .onChanged {self.dragAmount = $0.translation}
//        .onEnded {_ in
//            withAnimation(.spring()) {
//            self.dragAmount = .zero }
//            })

//Dragging around a string and seperating the letters in a snake fashion
//let letters = Array("Hello SwiftUI")
//@State private var enabled = false
//@State private var dragAmount = CGSize.zero
//HStack(spacing: 0) {
//    ForEach(0 ..< letters.count) { num in
//        Text(String(self.letters[num]))
//            .padding(5)
//            .font(.title)
//            .background(self.enabled ? Color.blue : Color.red)
//            .offset(self.dragAmount)
//            .animation(Animation.default.delay(Double(num) / 20))
//    }
//}
//.gesture(
//    DragGesture()
//        .onChanged {self.dragAmount = $0.translation}
//        .onEnded { _ in
//            self.dragAmount = .zero
//            self.enabled.toggle()
//        }
//)

//Creating a button that when tapped scales a rectangle up and then fades away on press
//VStack {
//    Button("Tap Me") {
//        withAnimation {
//        self.enabled.toggle()
//        }
//    }
//    if enabled {
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//        .transition(.asymmetric(insertion: .scale, removal: .opacity))
//    }
//}

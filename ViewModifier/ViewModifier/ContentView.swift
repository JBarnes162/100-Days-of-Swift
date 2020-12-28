//
//  ContentView.swift
//  ViewModifier
//
//  Created by Jackson Barnes on 28/12/2020.
//

import SwiftUI

struct BlueHeadingText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .padding()
            .background(Color.orange)
            .padding()
            .background(Color.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(BlueHeadingText())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Pina")
            .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

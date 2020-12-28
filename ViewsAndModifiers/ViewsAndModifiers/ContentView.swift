//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jackson Barnes on 28/12/2020.
//

import SwiftUI

//struct CapsuleText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .clipShape(Capsule())
//    }
//}

//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing){
//            content
//
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(Color.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        self.modifier(Watermark(text: text))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        self.modifier(Title())
//
//    }
//}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        //more to come
        VStack {
            ForEach(0 ..< rows, id: \.self) {row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
    

struct ContentView: View {
//    @State private var useRedText = false
//    let motto1 = Text("Draco dormiens")
//    let motto2 = Text("nunquam titillandus")
        var body: some View {
            GridStack(rows: 4, columns: 4) { row, col in
                HStack{
                    Image(systemName: "\(row * 4 + col).circle")
                }
                Text("R\(row) C\(col)")
            }
        }
    
    
    
    
    
//    var body: some View {
//
//        Text("Hello World")
//            .titleStyle()
//            .watermarked(with: "PinaLina")
        
//        VStack(spacing: 10) {
//            CapsuleText(text: "Pina")
//            CapsuleText(text: "Lina")
//        }
        
//        VStack {
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//        }
    
//        VStack {
//            Text("Angelina")
//            Text("Jackson")
//            Text("Greg")
//            Text("Steve")
//        }
//        .font(.title)
//        .blur(radius: 5)
//        Button("Hello World"){
//            self.useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red: .blue)
//
        
//        Form {
//            Section {
//            Text("Hello, world!")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color.blue)
//                .edgesIgnoringSafeArea(.all)
//                }
//            Button("Hello World") {
//                print(type(of: self.body))
//            }
//            .frame(width: 200, height: 200)
//            .background(Color.red)
//
//            Text("Hello World")
//                .padding()
//                .background(Color.red)
//                .padding()
//                .background(Color.blue)
//                .padding()
//                .background(Color.green)
//        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

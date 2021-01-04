//
//  ContentView.swift
//  Let Me Edutain You
//
//  Created by Jackson Barnes on 04/01/2021.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.blue)
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())

    }
}

extension Image {
    func flagImage() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(color: .black, radius: 1)
   }
}

struct ContentView: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    @State private var animalIcons = ["bear", "buffalo", "chick", "chicken",
                                     "cow", "crocodile", "dog", "duck",
                                     "elephant", "frog", "giraffe", "goat",
                                     "gorilla", "hippo", "horse", "monkey",
                                     "moose", "narwhal", "owl", "panda",
                                     "parrot", "penguin", "pig", "rabbit",
                                     "rhino", "sloth", "snake", "walrus",
                                     "whale", "zebra"]
    @State private var animalIcon = 17
    
    @State private var gameState = false                            // True for Playing - False for Settings
    @State private var multplicationTable = 1                       // Which multiplication table do they want questions for
    @State private var numberOfQuestion = 0                         // How many questions do they want to answer
    @State private var multiplyBy = Int.random(in: 0...11)          // To decide what to multiply the number with
    @State private var studentName = "Default Name"
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
    
    var body: some View {
            Group {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .topLeading
                                   , endPoint: .trailing).ignoresSafeArea()
                VStack{
                    HStack {
                        VStack {
                        Image(animalIcons[animalIcon])
                            .flagImage()
                            .padding()
                            
                            Text("\(studentName)")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    
                        Text("     Let Me Edutain You!")
                        .frame(width: 160, height: 75, alignment: .center)
                        .font(.title)
                        .titleStyle()
                    }
                    
                    Form{
                        Section(header: Text("What times table do you want to do?").foregroundColor(.white)){
                            Stepper(value: $multplicationTable, in:
                                        1...12, step: 1) {
                                Text("\(multplicationTable) times table")
                            }
                        }   .textCase(nil)
                            .font(.title3)
                            .foregroundColor(.black)
               
                            
                      
                        Section(header: Text("How many questions do you want?").foregroundColor(.white)) {
                            Picker("How many questions:", selection: $numberOfQuestion) {
                                ForEach(0 ..< numberOfQuestions.count) {
                                    Text("\(self.numberOfQuestions[$0])")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }   .textCase(nil)
                            .font(.title3)
                            .foregroundColor(.black)
                        
                    }
                    
                    VStack{
                        Button("Start!") {
                            // Do nothing
                            }
                        .titleStyle()
                        .font(.title)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

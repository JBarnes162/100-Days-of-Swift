//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Jackson Barnes on 27/12/2020.
//

import SwiftUI

extension Image {
    func flagImage() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 2))
            .shadow(color: .black, radius: 1)
   }
}


struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany",
                     "Ireland", "Italy", "Nigeria",
                     "Poland", "Russia", "Spain",
                     "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var animationAmount = 0.0
    @State private var userTapped = 0
    @State private var opacity = 1.0
    @State private var offset = CGFloat.zero
    @State private var disabled = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        if number == self.correctAnswer {
                            self.flagTapped(number)
                            self.userTapped = number
                            withAnimation(.easeInOut(duration: 2)) {
                                self.animationAmount += 360
                                self.opacity -= 0.75
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                                {self.askQuestions()}
                        } else {
                            self.flagTapped(number)
                            self.userTapped = number
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.offset = 200
                            }
                        }
                        self.disabled = true
                    })  {
                        Image(self.countries[number])
                            .flagImage()
                    }
                    .rotation3DEffect(.degrees(self.animationAmount), axis: (x: 0, y: number == self.userTapped ? 1 : 0, z : 0))
                    .offset(x: number != self.correctAnswer ? self.offset : .zero, y: .zero)
                    .clipped()
                    .opacity(number != self.userTapped ? self.opacity: 1.0)
                    .disabled(self.disabled)
                }
                Text("Your Current score is: \(userScore)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestions()
            })
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestions() {
        self.disabled = false
        self.opacity = 1
        self.offset = .zero
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

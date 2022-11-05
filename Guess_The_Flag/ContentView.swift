//
//  ContentView.swift
//  Guess_The_Flag
//
//  Created by Дарья Пивовар on 05.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Angola", "Argentina", "Australia", "Azerbaijan", "Belize", "Brazil", "Cambodia", "Canada", "Cyprus", "Dominica", "Estonia", "Ethiopia", "Germany", "Honduras", "Hungary", "Ireland", "Italy", "Kazakhstan", "Lithuania", "Netherlands", "New Zealand", "Poland", "Sweden", "Ukraine", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Venezuela"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8111491203, green: 0.7230046988, blue: 0.8553714156, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 25) {
                VStack {
                    Text("Choose the flag: ")
                        .foregroundColor(.init(#colorLiteral(red: 0.5194308162, green: 0.217292726, blue: 0.1953006983, alpha: 1)))
                        .font(.headline)
                        .fontDesign(.serif)
                    Text(countries[correctAnswer])
                        .foregroundColor(.init(#colorLiteral(red: 0.7824651599, green: 0.4505246282, blue: 0.3421041667, alpha: 1)))
                        .font(.largeTitle)
                        .fontDesign(.serif)
                        .fontWeight(.heavy)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .frame(width: 250, height: 130)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.init(#colorLiteral(red: 0.460793972, green: 0.4262518585, blue: 0.6175678968, alpha: 1)), lineWidth: 1))
                            .shadow(color: .init(#colorLiteral(red: 0.460793972, green: 0.4262518585, blue: 0.6175678968, alpha: 1)) ,radius: 20)
                    }
                }
                Text("Total score: \(score)")
                    .foregroundColor(.init(#colorLiteral(red: 0.5194308162, green: 0.217292726, blue: 0.1953006983, alpha: 1)))
                    .font(.headline)
                    .fontDesign(.serif)
                    .fontWeight(.black)
            }
        } .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Total score: \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Incorrect! It's a flag of \(countries[number])"
            score -= 1
        }
    }
        }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

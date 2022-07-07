//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Michel Henrique Hoekstra on 26/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State var correctAnswer = Int.random(in: 0 ... 2)
    @State var score = 0
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.36, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 100, endRadius: 550)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.title.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .flagNameTextStyled()
                    }

                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Score: \(score)")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .alert(scoreTitle,
               isPresented: $showingScore,
               actions: {
                   Button("Continue") {
                       askQuestion()
                   }
               },
               message: {
                   Text("Your score is \(score)")
               })
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
    let flag: String
    
    init(_ flag: String) {
        self.flag = flag
    }

    var body: some View {
        Image(flag)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
    }
}

struct FlagNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.largeTitle.weight(.semibold))
    }
}

extension View {
    func flagNameTextStyled() -> some View {
        modifier(FlagNameText())
    }
}

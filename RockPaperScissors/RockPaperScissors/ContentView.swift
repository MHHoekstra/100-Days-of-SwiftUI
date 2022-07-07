//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Michel Henrique Hoekstra on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]

    @State var shouldWin = Bool.random()
    @State var randomOption = Int.random(in: 0 ... 2)
    @State var score = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(uiColor: .black), .indigo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("To \(shouldWin ? "WIN" : "LOSE") against")
                    .foregroundStyle(.ultraThickMaterial)
                    .font(.title.bold())
                Text("\(options[randomOption])".uppercased())
                    .foregroundStyle(.ultraThickMaterial)
                    .font(.title.bold())
                VStack(spacing: 15) {
                    ForEach(0 ..< 3, content: { number in
                        Button(action: {
                            checkAnswer(number)
                        }, label: {
                            Text("\(options[number])")
                                .frame(width: 200, height: 40, alignment: .center)
                        })
                        .background(.regularMaterial)
                        .cornerRadius(8)
                    })
                }
                .padding()
                .frame(minWidth: 0,
                       idealWidth: .infinity,
                       maxWidth: .infinity,
                       minHeight: 0,
                       idealHeight: .infinity,
                       maxHeight: .infinity,
                       alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                Text("Score: \(score)")
                    .foregroundStyle(.ultraThickMaterial)
            }
            .padding()
        }
    }

    func randomize() {
        shouldWin = Bool.random()
        randomOption = Int.random(in: 0 ... 2)
    }

    func checkAnswer(_ answer: Int) {
        if shouldWin {
            switch answer {
            case 0:
                if randomOption == 2 {
                    score += 1
                }
            case 1:
                if randomOption == 0 {
                    score += 1
                }
            case 2:
                if randomOption == 1 {
                    score += 1
                }
            default:
                break
            }
        }
        else {
            switch answer {
            case 0:
                if randomOption == 1 {
                    score += 1
                }
            case 1:
                if randomOption == 2 {
                    score += 1
                }
            case 2:
                if randomOption == 0 {
                    score += 1
                }
            default:
                break
            }
        }
        randomize()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

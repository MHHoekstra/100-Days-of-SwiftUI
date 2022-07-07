//
//  ContentView.swift
//  WeSplit
//
//  Created by Michel Henrique Hoekstra on 24/06/22.
//


import SwiftUI

struct ContentView: View {
    @State private var numberOfPeople = 2
    @State private var checkAmount = 0.0
    @State private var tipPercentage = 0.0
    @FocusState private var amountIsFocused: Bool
    var tipPercentages = [0.0, 0.1, 0.2, 0.3]
    var total: Double {
        (checkAmount + checkAmount * tipPercentage) / Double(numberOfPeople)
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"), prompt: Text("Charged amount")).disableAutocorrection(true).keyboardType(.decimalPad).focused($amountIsFocused)
                    Picker("# of people", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(total, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total for each person")
                }
                
            }
            .navigationTitle("WeSplit").navigationBarTitleDisplayMode(.inline).toolbar(content: {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Button("Done", action: {
                        amountIsFocused = false
                    })
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

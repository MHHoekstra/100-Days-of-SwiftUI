//
//  TemperatureSection.swift
//  Converter
//
//  Created by Michel Henrique Hoekstra on 25/06/22.
//

import SwiftUI

struct TemperatureSection: View {
    private let temperatureTypes: [String] = ["Farenheit", "Kelvin"]
    @State private var temperatureToType: String = "Farenheit"
    @State private var temperature: Double = 0.0
    @FocusState private var temperatureFocus
    private var transformedTemperature: Double {
        switch temperatureToType {
        case "Farenheit":
            return temperature*9/5 + 32
        case "Kelvin":
            return temperature + 273.15
        default:
            return 0.0
        }
    }
    var body: some View {
        Section("Temperature in Celcius") {
            TextField("Celcius", value: $temperature, format: .number)
                .keyboardType(.namePhonePad)
                .focused($temperatureFocus)
            HStack {
                Text("To")
                Picker("To", selection: $temperatureToType, content: {
                    ForEach(temperatureTypes, id: \.self, content: {Text($0)})
                })
                .pickerStyle(.segmented)
            }
            Text("\(temperature.formatted()) Celcius are \(transformedTemperature.formatted()) \(temperatureToType)")
        }
    }
}

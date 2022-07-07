//
//  ContentView.swift
//  Converter
//
//  Created by Michel Henrique Hoekstra on 25/06/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        List {
            DistanceSection()
            TemperatureSection()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}


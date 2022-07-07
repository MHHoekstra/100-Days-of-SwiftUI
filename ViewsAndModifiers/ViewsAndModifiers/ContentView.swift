//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Michel Henrique Hoekstra on 06/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var useRed = false
    var body: some View {
        GridStack(rows: 5, columns: 6) { row, col in
            Text("R\(row) C\(col)")
                .frame(width: 60, height: 30, alignment: .center)
                .background(col.isMultiple(of: 2) ? .mint : .blue)
                .watermarked(with: "M")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack(alignment: .center){
            ForEach(0..<rows, id: \.self) { row in
                HStack(alignment: .center){
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

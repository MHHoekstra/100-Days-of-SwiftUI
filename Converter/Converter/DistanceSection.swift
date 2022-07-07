import SwiftUI

struct DistanceSection: View {
    private let distanceTypes: [String] = ["Feets", "Miles", "Kilometers"]
    @State private var distanceToType: String = "Feets"
    @State private var distance: Double = 0.0
    @FocusState private var distanceFocus
    private var transformedDistance: Double {
        switch distanceToType {
        case "Feets":
            return distance*3.281
        case "Miles":
            return distance/1609
        case "Kilometers":
            return distance/1000
        default:
            return 0.0
        }
    }
    var body: some View {
        Section("Distance in meters") {
            TextField("Meters", value: $distance, format: .number)
                .keyboardType(.decimalPad)
                .focused($distanceFocus)
            HStack {
                Text("To")
                Picker("To", selection: $distanceToType, content: {
                    ForEach(distanceTypes, id: \.self, content: {Text($0)})
                })
                .pickerStyle(.segmented)
            }
            Text("\(distance.formatted()) Meters are \(transformedDistance.formatted()) \(distanceToType)")
        }
    }
}

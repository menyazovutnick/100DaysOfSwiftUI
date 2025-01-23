//
//  ContentView.swift
//  Unit Converter
//
//  Created by Nick Khachatryan on 22.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    private var lengthOptions: [String] = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    private var lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 0

    @State private var inputValue = 0.0
    
    private var convertedValue: Double {
        let value = inputValue
        let convertedValue = Measurement(value: value, unit: lengthUnits[selectedInputUnit])
        return convertedValue.converted(to: lengthUnits[selectedOutputUnit]).value
        
    }
    
    var body: some View {
        VStack {
            Form {
                
                Section {
                    TextField("Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $selectedInputUnit) {
                        ForEach(0..<lengthOptions.count) {
                            Text("\(lengthOptions[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text("\(convertedValue)")
                    
                    Picker("Unit", selection: $selectedOutputUnit) {
                        ForEach(0..<lengthOptions.count) {
                            Text("\(lengthOptions[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

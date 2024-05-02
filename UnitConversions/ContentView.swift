//
//  ContentView.swift
//  UnitConversions
//
//  Created by Nick Krasnitskiy on 02.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    @State private var inputValue = 0.0
    @FocusState private var fieldSsActive: Bool
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var result: Double {
        var inputMeters = 0.0
        var outputMeters = 0.0
        
        switch inputUnit {
        case "meters":
            inputMeters = inputValue
        case "kilometers":
            inputMeters = inputValue * 1000
        case "feet":
            inputMeters = inputValue * 0.3048
        case "yards":
            inputMeters = inputValue * 0.9144
        default:
            inputMeters = inputValue * 1609.34
        }
        
        switch outputUnit {
        case "meters":
            outputMeters = inputMeters
        case "kilometers":
            outputMeters = inputMeters / 1000
        case "feet":
            outputMeters = inputMeters / 0.3048
        case "yards":
            outputMeters = inputMeters / 0.9144
        default:
            outputMeters = inputMeters / 1609.34
        }
        
        return outputMeters
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose an input unit") {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Choose an output unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter a value") {
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($fieldSsActive)
                }
                
                Section("Result of conversion") {
                    Text(result, format: .number)
                }
            }
            .navigationTitle("Unit Conversions")
            .toolbar {
                if fieldSsActive {
                    Button("Done") {
                        fieldSsActive = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

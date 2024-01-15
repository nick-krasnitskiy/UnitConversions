//
//  ContentView.swift
//  UnitConversions
//
//  Created by Nick Krasnitskiy on 12.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedInput = "meters"
    @State private var selectedOuput = "meters"
    @State private var inputValue = 0.0
    
    let lenghtConversion = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var conversionResult: Double {
        var inputMeters = 0.0
        var output = 0.0
        
        switch selectedInput {
        case "meters":
            inputMeters = inputValue
        case "kilometers":
            inputMeters = inputValue * 1000
        case "feet":
            inputMeters = inputValue * 0.3048
        case "yards":
            inputMeters = inputValue * 0.9144
        case "miles":
            inputMeters = inputValue * 1609.34
        default:
            inputMeters = 0.0
        }
        
        switch selectedOuput {
        case "meters":
            output = inputMeters
        case "kilometers":
            output = inputMeters / 1000
        case "feet":
            output = inputMeters / 0.3048
        case "yards":
            output = inputMeters / 0.9144
        case "miles":
            output = inputMeters / 1609.34
        default:
            output = 0.0
        }
        
        return output
    }
    
    var body: some View {
        Form {
            Section("Choose an imput unit") {
                Picker("Input unit", selection: $selectedInput) {
                    ForEach(lenghtConversion, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Choose an output unit") {
                Picker("Output value", selection: $selectedOuput) {
                    ForEach(lenghtConversion, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Enter a value") {
                TextField("Input value", value: $inputValue, format: .number)
            }
            
            Section("Result of the conversion") {
                Text(conversionResult.formatted())
            }
            
        }
    }
}

#Preview {
    ContentView()
}

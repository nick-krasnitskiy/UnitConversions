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
        return 0.0
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
                Text(conversionResult, format: .number)
            }
            
        }
    }
}

#Preview {
    ContentView()
}

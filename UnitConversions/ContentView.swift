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
                    Text("")
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

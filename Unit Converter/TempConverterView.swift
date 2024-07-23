//
//  TempConverterView.swift
//  Unit Converter
//
//  Created by Jesutofunmi Adewole on 23/07/2024.
//

import SwiftUI

struct TempConverterView: View {
    
    var tempUnitOptions = ["C", "F", "K"]
   
    
    @State private var tempInputUnit = "C"
    @State private var tempOutputUnit = "K"
    @State private var tempInputValue = 0.0
    
    var tempConversionResult: Double {
        switch tempOutputUnit {
        case "C":
            return tempInputInC
        case "F":
            return (9/5 * tempInputInC) + 32
        case "K":
            return tempInputInC + 273.15
        default:
            return tempInputInC
        }
    }
    
    var tempInputInC: Double {
        switch tempInputUnit {
        case "C":
            return tempInputValue
        case "F":
            return ((tempInputValue - 32) * 5)/9
        case "K":
            return tempInputValue - 273.15
        default:
            return tempInputValue
        }
    }
    var body: some View {
        NavigationView {
            Form {
                Section("Select unit to convert from:") {
                    Picker("Input unit", selection: $tempInputUnit) {
                        ForEach(tempUnitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select unit to convert to:") {
                    Picker("Output unit", selection: $tempOutputUnit) {
                        ForEach(tempUnitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter temperature in °\(tempInputUnit)") {
                    TextField("Value to convert", value: $tempInputValue, format: .number)
                }
                
                Section("Here's your temperature in °\(tempOutputUnit)") {
                    //                Text(conversionResult, format: .number)
                    Text("\(tempConversionResult.formatted())°\(tempOutputUnit)")
                }
                
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }    }
}

#Preview {
    TempConverterView()
}

//
//  LengthConverterView.swift
//  Unit Converter
//
//  Created by Jesutofunmi Adewole on 23/07/2024.
//

import SwiftUI

struct LengthConverterView: View {
    
    var lenUnitOptions = ["m", "ft", "mi", "km", "yd"]

    @State private var lenInputUnit = "ft"
    @State private var lenOutputUnit = "km"
    @State private var lenInputValue = 0.0
    
    var lenConversionResult: Double {
        switch lenOutputUnit {
        case "km":
            return lenInMeters/1000
        case "ft":
            return lenInMeters * 3.281
        case "yd":
            return lenInMeters * 1.094
        case "mi":
            return lenInMeters/1609
        default:
            return lenInMeters
        }
    }
    
    var lenInMeters: Double {
        switch lenInputUnit {
        case "km":
            return lenInputValue * 1000
        case "ft":
            return lenInputValue/3.281
        case "yd":
            return lenInputValue/1.094
        case "mi":
            return lenInputValue * 1609
        default:
            return lenInputValue
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Select unit to convert from:") {
                    Picker("Input unit", selection: $lenInputUnit) {
                        ForEach(lenUnitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select unit to convert to:") {
                    Picker("Output unit", selection: $lenOutputUnit) {
                        ForEach(lenUnitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter length in \(lenInputUnit)") {
                    TextField("Value to convert", value: $lenInputValue, format: .number)
                }
                
                Section("Here's your length in \(lenOutputUnit)") {
                    //                Text(conversionResult, format: .number)
                    Text("\(lenConversionResult.formatted()) \(lenOutputUnit)")
                }
                
            }
            .navigationTitle("Length Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LengthConverterView()
}

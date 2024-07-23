//
//  ContentView.swift
//  Unit Converter
//
//  Created by Jesutofunmi Adewole on 12/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var tempUnitOptions = ["C", "F", "K"]
   
    var lenUnitOptions = ["m", "ft", "mi", "km", "yd"]
    
    @State private var tempInputUnit = "C"
    @State private var tempOutputUnit = "K"
    @State private var tempInputValue = 0.0
    
    @State private var lenInputUnit = "ft"
    @State private var lenOutputUnit = "km"
    @State private var lenInputValue = 0.0
    
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
        }
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

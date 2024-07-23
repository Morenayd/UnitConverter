//
//  ContentView.swift
//  Unit Converter
//
//  Created by Jesutofunmi Adewole on 12/02/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: TempConverterView()) {
                    Text("Temperature Conversion")
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(.brown)
                        .clipShape(.buttonBorder)
                        
                }
                NavigationLink(destination: LengthConverterView()) {
                    Text("Length Conversion")
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(.cyan)
                        .clipShape(.buttonBorder)
                        
                }
            }
            .navigationTitle("Unit Converter App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

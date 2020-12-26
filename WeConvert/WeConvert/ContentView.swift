//
//  ContentView.swift
//  WeConvert
//
//  Created by Jackson Barnes on 26/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var convertFrom = 0
    @State private var convertTo = 0
    @State private var userInput = ""

    let volumeMeasurement = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    
    var convertedValue: Double {
        //calculate the converted value
        var userConvertFrom = Double(userInput) ?? 0
        
        switch convertFrom {
        case 0:
            // Milliliters
            userConvertFrom += 0
        case 1:
            // Liters
            userConvertFrom *= 1000
        case 2:
            // Cups
            userConvertFrom *= 284.131
        case 3:
            // Pints
            userConvertFrom *= 568.261
        case 4:
            // Gallons
            userConvertFrom *= 4546.09
        default:
            print("Should never reach here")
        }
        
        switch convertTo {
        case 0:
            // Milliliters
            userConvertFrom += 0
        case 1:
            // Liters
            userConvertFrom /= 1000.0
        case 2:
            // Cups
            userConvertFrom /= 284.0
        case 3:
            // Pints
            userConvertFrom /= 568.0
        case 4:
            // Gallons
            userConvertFrom /= 4546.0
        default:
            print("Should never reach here")
        }
        return userConvertFrom
    }
    
    var body: some View {
        NavigationView{
            Form {
                
                Section (header: Text("Input your value:")){
                    TextField("Input", text: $userInput)
                        .keyboardType(.numberPad)
                }
                
                Section (header: Text("Select your conversion:")) {
                    Picker(selection: $convertFrom, label: Text("Convert From:")) {
                        ForEach(0..<volumeMeasurement.count) {
                            Text("\(volumeMeasurement[$0])")
                        }
                    }
                
                    Picker(selection: $convertTo, label: Text("Convert To:")) {
                        ForEach(0..<volumeMeasurement.count) {
                            Text("\(volumeMeasurement[$0])")
                        }
                    }
                }
                
                Section (header: Text("Converted value: ")) {
                    Text("Output: \(convertedValue.isNaN ? 0 : convertedValue.isInfinite ? 0 : convertedValue, specifier: "%.3f")")
                }
        }
            .navigationBarTitle("WeConvert")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

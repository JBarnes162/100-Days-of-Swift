//
//  ContentView.swift
//  WeSplit
//
//  Created by Jackson Barnes on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""         // Text fields have to take strings
    @State private var numberOfPeople = ""       // Nice default value that works sometimes
    @State private var tipPercentage = 2        // Using 2 because using it to select value from predetermined array
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0  //this tries to convert to double, if fails returns 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var finalBill: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0  //this tries to convert to double, if fails returns 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople){
//                        ForEach(2..<100) {
//                            Text("\($0) people")
//                        }
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip would you like to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Amount")){
                    Text("£\(finalBill, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("£\(totalPerPerson.isNaN ? 0 : totalPerPerson.isInfinite ? 0 : totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            }
        }
    }
}

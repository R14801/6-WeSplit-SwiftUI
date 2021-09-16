//
//  MainView.swift
//  WeSplit
//
//  Created by Rajat Nagvenker on 9/14/21.
//

import SwiftUI

struct CalculationView: View {
    @State var checkAmount = ""
    @State var noOfPeople = 2
    @State var tipPercentage = 2
    let tipPercentages = [5, 10, 15, 20, 25, 0]
    var totalPerPerson : Double {
        let peopleCount = Double(noOfPeople+2)
        let tipSelection = (Double(tipPercentages[tipPercentage]))
        let orderAmount = Double (checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount : Double {
        let tipSelection = (Double(tipPercentages[tipPercentage]))
        let orderAmount = Double (checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
        
    }
    
    var body: some View {
//        NavigationView {
            Form{
                Section(header: Text("Details")) {
                    TextField("Enter the amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $noOfPeople) {
                        ForEach(2..<100) { i in
                            Text("\(i) People")
                        }
                    }

                    Text("Tip Percentage")
                    Picker("Select tip", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) { i in
                            Text("\(tipPercentages[i])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.padding(.vertical, 10)
                
                
                Section(header: Text("Amount Breakdown")) {
                    Text("Amount: \(checkAmount)")
                    Text("Tip: \(tipPercentages[tipPercentage])%")
                    Text("Total: \(String(format: "%.2f", totalAmount))")
                    Text("No. of People: \(noOfPeople+2)")
                    Text("Amount/Person: \(String(format: "%.2f", totalPerPerson))")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.vertical, 10)
                
                
                
            }.navigationBarHidden(false)
            .navigationBarTitle("WeSplit")
            .navigationBarItems(trailing: Image("Icon").resizable().scaledToFit().frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(5))
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
            .previewDevice("iPhone 12")
    }
}

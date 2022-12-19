//
//  ContentView.swift
//  CupcakeCorner-HWS-10
//
//  Created by Kevin Mattocks on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = OrderViewModel()
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(OrderViewModel.types.indices) {
                            Text(OrderViewModel.types[$0])
                        }
                    }
                    
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequesetEnabled.animation())
                    
                    if order.specialRequesetEnabled {
                        Toggle("Add extra frosting", isOn:  $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink{
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
 Cupcake has different types which is a string array but we're storing the user's selection as an Int. To match the two different types, we use the indices property of the array which gives us a position of each item that we can then use with as an array index.
 
 Not good for mutable arrays (i.e. var). Static arrays is okay.
 */

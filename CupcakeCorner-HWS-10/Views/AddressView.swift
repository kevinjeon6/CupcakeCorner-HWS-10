//
//  AddressView.swift
//  CupcakeCorner-HWS-10
//
//  Created by Kevin Mattocks on 12/19/22.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: OrderViewModel
    //Passing in the order we are currently working with
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip code", text: $order.zip)
            }
         
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: OrderViewModel())
        }
    }
}

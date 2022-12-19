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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: OrderViewModel())
    }
}

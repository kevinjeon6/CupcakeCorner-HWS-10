//
//  CheckoutView.swift
//  CupcakeCorner-HWS-10
//
//  Created by Kevin Mattocks on 12/19/22.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: OrderViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: OrderViewModel())
    }
}

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
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    //adjusting the Async image
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
            }
            
            Text("Your total is \(order.cost, format: .currency(code: "USDD"))")
                .font(.title)
            
            Button {
                //
            } label: {
                Text("Place Order")
            }
            .padding()

        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: OrderViewModel())
        }
    }
}

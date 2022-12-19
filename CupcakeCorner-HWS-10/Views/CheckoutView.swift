//
//  CheckoutView.swift
//  CupcakeCorner-HWS-10
//
//  Created by Kevin Mattocks on 12/19/22.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: OrderViewModel
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
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
                Task {
                    await placeOrder()
                }
            } label: {
                Text("Place Order")
            }
            .padding()

        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation){
            Button("OK") {}
            
        } message: {
             Text(confirmationMessage)
        }
    }
    
    
    //MARK: - Methods
    
    func placeOrder() async {
        //Convert our current orderViewModel object into some JSON data that can be sent
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        //Tell Swift how to send that data over a network call
        let url = URL(string: "https://reqres.in/api/cucakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        //Run that request and process the response
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            //handle the result
            
            let decodedOrder = try JSONDecoder().decode(OrderViewModel.self, from: encoded)
            confirmationMessage = "Your order for \(decodedOrder.quantity) x \(OrderViewModel.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Check out failed")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: OrderViewModel())
        }
    }
}


/*
 The HTTP method of a request determines how data should be sent. There are several HTTP methods, but in practice only GET (“I want to read data”) and POST (“I want to write data”) are used much. We want to write data here, so we’ll be using POST.
 */

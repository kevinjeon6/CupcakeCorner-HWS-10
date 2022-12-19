//
//  Order.swift
//  CupcakeCorner-HWS-10
//
//  Created by Kevin Mattocks on 12/19/22.
//

import Foundation

class OrderViewModel: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequesetEnabled = false {
        didSet {
            if specialRequesetEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    
    //MARK: - Delivery details
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    //MARK: - Validating
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
}


/*
 Use a didSet property to specialRequest. That will run when the value changes
 */

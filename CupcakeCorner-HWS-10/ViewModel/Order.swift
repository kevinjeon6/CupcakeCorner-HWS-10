//
//  Order.swift
//  CupcakeCorner-HWS-10
//
//  Created by Kevin Mattocks on 12/19/22.
//

import Foundation

class OrderViewModel: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        //Properties that we want to encode
        case type
        case quantity
        case extraFrosting
        case addSprinkles
        case name
        case streetAddress
        case city
        case zip
    }
    
    
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
    
    //MARK: - Calculating the cost
    var cost: Double {
        //$2 per cake
        
        var cost = Double(quantity) * 2
        
        //complicated cakes cost more
        
        cost += (Double(type) / 2)
        
        //$1 cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
            
        }
        
        //$0.50 cake for sprinkles
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
        
        
    }
    
    init() {
        //The new initializer since the required init provided errors where we wanted to create a new empty Order
    }
    
    
    /*
     Can encode the data in any order you want - don't need to match the order in which properties are declared in your object
     */
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
        
    }
    
}


/*
 Use a didSet property to specialRequest. That will run when the value changes
 */

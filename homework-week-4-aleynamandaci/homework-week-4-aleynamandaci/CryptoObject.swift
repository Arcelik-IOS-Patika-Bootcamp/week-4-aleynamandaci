//
//  CryptoObject.swift
//  homework-week-4-aleynamandaci
//
//  Created by Aleyna Mandacı on 11.06.2022.
//

import Foundation

struct CryptoObject : Decodable {
    
    let cryptoName : String
    let cryptoSymbol : String
    let cryptoPrice : String
    let cryptoLogoUrl : String
    
    enum CodingKeys : String , CodingKey {
        case cryptoName = "name"
        case cryptoSymbol = "symbol"
        case cryptoLogoUrl = "logo_url"
        case cryptoPrice = "price"
    }
}

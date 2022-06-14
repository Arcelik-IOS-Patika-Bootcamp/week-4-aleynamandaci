//
//  CryptoObject.swift
//  homework-week-4-aleynamandaci
//
//  Created by Aleyna Mandacı on 11.06.2022.
//

import Foundation

struct CryptoObject : Codable {
    
    let cryptoName : String
    let cryptoSymbol : String
    let cryptoPrice : Float
    let cryptoLogoUrl : String
    let cryptoChangePercentage24h : Float
    
    enum CodingKeys : String , CodingKey {
        case cryptoName = "name"
        case cryptoSymbol = "symbol"
        case cryptoLogoUrl = "image"
        case cryptoPrice = "current_price"
        case cryptoChangePercentage24h = "price_change_percentage_24h"
    }
}



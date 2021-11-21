//
//  Model.swift
//  MasterdataApp
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

// MARK: - ResponseData
struct ResponseData: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let type: String?
    let attributes: DataAttributes?
}

// MARK: - DataAttributesz
struct DataAttributes: Codable {
    let cryptocoins, commodities, fiats: [Commodity]?
    let wallets, commodityWallets, fiatwallets: [Wallet]?

    enum CodingKeys: String, CodingKey {
        case cryptocoins, commodities, fiats, wallets
        case commodityWallets = "commodity_wallets"
        case fiatwallets 
    }
}


//
//  CommodityWallet.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

// MARK: - CommodityWalletAttributes
struct CommodityWalletAttributes: Codable {
    let cryptocoinID, cryptocoinSymbol, balance: String?
    let isDefault: Bool?
    let name: String?
    let pendingTransactionsCount: Int?
    let deleted: Bool?
    
    let fiatID, fiatSymbol: String?

    enum CodingKeys: String, CodingKey {
        case cryptocoinID = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case balance
        case isDefault = "is_default"
        case name
        case pendingTransactionsCount = "pending_transactions_count"
        case deleted
        
        case fiatID = "fiat_id"
        case fiatSymbol = "fiat_symbol"
    }
}

enum CommodityWalletType: String, Codable {
    case wallet = "wallet"
    case fiatwallet = "fiat_wallet"
}


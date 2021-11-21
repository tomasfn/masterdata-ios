//
//  Wallet.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

// MARK: - Wallet
struct Wallet: Codable {
    let type: CommodityWalletType?
    let attributes: CommodityWalletAttributes?
    let id: String?
}

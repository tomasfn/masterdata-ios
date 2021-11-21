//
//  Commodities.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

// MARK: - Commodity
struct Commodity: Codable {
    let type: AssetTypeNameEnum?
    let attributes: CommodityAttributes?
    let id: String?
}

// MARK: - CommodityAttributes
struct CommodityAttributes: Codable {
    let symbol: String?
    let name: String?
    let assetTypeName: AssetTypeNameEnum?
    let assetGroupName: AssetGroupName?
    let available: Bool?
    let precisionForFiatPrice: Int?
    let avgPrice: String?
    let color: String?
    let logo, logoDark: String?
    let family: Family?
    let precision: Int?
    let toEurRate: String?
    let symbolCharacter: String?
    let hasWallets: Bool?
    let logoWhite: String?
    let logoColor: String?

    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case assetTypeName = "asset_type_name"
        case assetGroupName = "asset_group_name"
        case available
        case precisionForFiatPrice = "precision_for_fiat_price"
        case avgPrice = "avg_price"
        case color
        case logo
        case logoDark = "logo_dark"
        case family
        case precision
        case toEurRate = "to_eur_rate"
        case symbolCharacter = "symbol_character"
        case hasWallets = "has_wallets"
        case logoWhite = "logo_white"
        case logoColor = "logo_color"
    }
}

enum AssetGroupName: String, Codable {
    case coin = "coin"
    case metal = "metal"
}

enum AssetTypeNameEnum: String, Codable {
    case commodity = "commodity"
    case cryptocoin = "cryptocoin"
    case fiat = "fiat"
}

enum Family: String, Codable {
    case eth = "ETH"
    case neo = "NEO"
}

// MARK: - IeoPhase
struct IeoPhase: Codable {
    let type: String?
    let attributes: IeoPhaseAttributes?
    let id: String?
}

// MARK: - IeoPhaseAttributes
struct IeoPhaseAttributes: Codable {
    let name: String?
    let phaseNumber: Int?
    let startDate: DateClass?
    let endDate: DateClass?
    let maxStock: String?
    let price: String?
    let active: Bool?

    enum CodingKeys: String, CodingKey {
        case name
        case phaseNumber = "phase_number"
        case startDate = "start_date"
        case endDate = "end_date"
        case maxStock = "max_stock"
        case price
        case active
    }
}

// MARK: - DateClass
struct DateClass: Codable {
    let dateIso8601: String?
    let unix: String?

    enum CodingKeys: String, CodingKey {
        case dateIso8601 = "date_iso8601"
        case unix
    }
}

enum IosSupportedVersion: String, Codable {
    case the100 = "1.0.0"
    case the101 = "1.0.1"
}

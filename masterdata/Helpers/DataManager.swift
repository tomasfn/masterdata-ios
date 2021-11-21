//
//  DataManager.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

class DataManager {
    
    class func loadJson() -> DataClass? {
        if let url = Bundle.main.url(forResource: "Masterdata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    class func dataForWallets() -> [Wallet]? {
        let data = loadJson()
        var wallets: [Wallet] = [Wallet]()
        guard let walletsData = data?.attributes?.wallets, let fiatWallets = data?.attributes?.fiatwallets, let commodityWallets = data?.attributes?.commodityWallets else { return nil }
        wallets.append(contentsOf: walletsData)
        wallets.append(contentsOf: fiatWallets)
        wallets.append(contentsOf: commodityWallets)
        return wallets
    }
    
    class func dataForAssets() -> [Commodity]? {
        let data = loadJson()
        var commodities: [Commodity] = [Commodity]()
        guard let commoditiesData = data?.attributes?.commodities, let cryptocoins = data?.attributes?.cryptocoins, let fiats = data?.attributes?.fiats else { return nil }
        commodities.append(contentsOf: commoditiesData)
        commodities.append(contentsOf: cryptocoins)
        commodities.append(contentsOf: fiats)
        return commodities
    }
    
    class func dataCommodityWallets() -> [Wallet]? {
        let data = loadJson()
        var wallets: [Wallet] = [Wallet]()
        guard let commodityWallets = data?.attributes?.commodityWallets else { return nil }
        wallets.append(contentsOf: commodityWallets)
        return wallets
    }
    
    class func dataFiatWallets() -> [Wallet]? {
        let data = loadJson()
        var wallets: [Wallet] = [Wallet]()
        guard let fiatWallets = data?.attributes?.fiatwallets else { return nil }
        wallets.append(contentsOf: fiatWallets)
        return wallets
    }
    
    class func dataWallets() -> [Wallet]? {
        let data = loadJson()
        var wallets: [Wallet] = [Wallet]()
        guard let walletsData = data?.attributes?.wallets else { return nil }
        wallets.append(contentsOf: walletsData)
        return wallets
    }
}

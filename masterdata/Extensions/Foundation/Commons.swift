//
//  Commons.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

extension NSObject {
    public class var nameOfClass: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension NSDecimalNumber {
    
    func roundHalfToEvenBankingRounding() -> NSDecimalNumber {
        let handler = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.bankers, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let rounded = self.rounding(accordingToBehavior: handler)
        return rounded
    }

    func makeRoundingNumber(with scale: Int16) -> NSDecimalNumber {
        let numberHandler = NSDecimalNumberHandler(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        return self.rounding(accordingToBehavior: numberHandler)
    }
}

extension String{
     func toCurrencyFormat() -> String {
        if let intValue = Int(self) {
           let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale.current
           numberFormatter.numberStyle = NumberFormatter.Style.currency
           return numberFormatter.string(from: NSNumber(value: intValue)) ?? ""
      }
    return ""
  }
}


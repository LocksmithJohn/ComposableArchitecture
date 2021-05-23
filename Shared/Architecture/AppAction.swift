//
//  AppAction.swift
//  Trening_Composable_Architecture
//
//  Created by Jan Ślusarz on 30/04/2021.
//

import Foundation
import Shopping
import Invoices
import History

enum AppAction {
    case shopping(ShoppingAction)
    case invoice(InvoiceAction)
    case history(HistoryAction)
}

extension AppAction {
    
    var shopping: ShoppingAction? {
        get {
            guard case let .shopping(value) = self else { return nil }
            return value
        }
        set {
            guard case .shopping = self, let newValue = newValue else { return }
            self = .shopping(newValue)
        }
    }
    
    var invoice: InvoiceAction? {
        get {
            guard case let .invoice(value) = self else { return nil }
            return value
        }
        set {
            guard case .invoice = self, let newValue = newValue else { return }
            self = .invoice(newValue)
        }
    }
    
    var history: HistoryAction? {
        get {
            guard case let .history(value) = self else { return nil }
            return value
        }
        set {
            guard case .history = self, let newValue = newValue else { return }
            self = .history(newValue)
        }
    }

}

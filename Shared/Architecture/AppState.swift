//
//  AppState.swift
//  Trening_Composable_Architecture (iOS)
//
//  Created by Jan Ślusarz on 30/04/2021.
//

import Combine
import SwiftUI
import Invoices

struct AppState {
    
    var currentInvoiceValue: Int = 0
    var invoiceValues: [Int] = []
    
    var currentShoppingValue: Int = 0
    var shoppingValue: [Int] = []
    
    var loggedInUser: User? = nil
    
    var activityFeed: [Activity] = [] {
        didSet {
            activityFeed.forEach {
                print("filter - activity: \($0.timeStamp) - \($0.type)")
            }
        }
    }
    
    struct Activity {
        let timeStamp: Date
        let type: ActivityType
        
        enum ActivityType {
            case addedInvoice(Int)
            case removedInvoice(Int)
            
            var addedInvoice: Int? {
                get {
                    guard case let .addedInvoice(value) = self else { return nil }
                    return value
                }
                set {
                    guard case .addedInvoice = self, let newValue = newValue else { return }
                    self = .addedInvoice(newValue)
                }
            }
            
            var removedFavoritePrime: Int? {
                get {
                    guard case let .removedInvoice(value) = self else { return nil }
                    return value
                }
                set {
                    guard case .removedInvoice = self, let newValue = newValue else { return }
                    self = .removedInvoice(newValue)
                }
            }
        }
    }
    
    struct User {
        let id: Int
        let name: String
        let bio: String
    }
    
}

extension AppState {
    var invoiceState: InvoiceState {
        get {
            InvoiceState(currentInvoiceValue: currentInvoiceValue,
                         invoiceValues: invoiceValues)
        }
        set {
            currentInvoiceValue = newValue.currentInvoiceValue
            invoiceValues = newValue.invoiceValues
        }
    }
}

//
//  Reducer.swift
//  Trening_Composable_Architecture
//
//  Created by Jan Ślusarz on 30/04/2021.
//

import ComposableArchitecture
import History
import Foundation
import Invoices
import Shopping

func activityFeed(_ reducer: @escaping (inout AppState, AppAction) -> Void) -> (inout AppState, AppAction) -> Void {
  return { state, action in
    switch action {
    case .invoice(.addedToInvoicesTapped):
        state.activityFeed.append(.init(timeStamp: Date(), type: .addedInvoice(state.currentInvoiceValue)))
    case .invoice(.removeFromInvoicesTapped):
        state.activityFeed.append(.init(timeStamp: Date(), type: .removedInvoice(state.currentInvoiceValue)))
    case .history(.removeInvoiceTapped):
        state.activityFeed.append(.init(timeStamp: Date(), type: .removedInvoice(state.currentInvoiceValue)))
    default:
        break
    }

    reducer(&state, action)
  }
}

let appReducer: (inout AppState, AppAction) -> Void = combine(
    pullback(invoiceReduce, value: \.invoiceState, action: \.invoice),
    pullback(shoppingReduce, value: \.currentShoppingValue, action: \.shopping),
    pullback(historyReduce, value: \.invoiceValues, action: \.history)
)

//
//  ContentView.swift
//  Shared
//
//  Created by Jan Ślusarz on 29/04/2021.
//

import ComposableArchitecture
import SwiftUI
import Shopping
import Invoices
import History

struct ContentView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    var body: some View {
        TabView {
            
            ShoppingView(store: store.viewInto(
                value: { $0.currentShoppingValue },
                action: { .shopping($0) }
            )).tabItem { Label("Shopping", systemImage: "list.dash") }
            
            InvoiceView(store: store.viewInto(
                value: { $0.invoiceState },
                action: { .invoice($0) }
            )).tabItem { Label("Invoice", systemImage: "square.and.pencil") }
            
            HistoryView(store: store.viewInto(
                value: { $0.invoiceValues },
                action: { .history($0) }
            )).tabItem { Label("History", systemImage: "square.and.pencil") }
            
        }
    }
}

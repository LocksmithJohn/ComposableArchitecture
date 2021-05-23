//
//  History.swift
//  History
//
//  Created by Jan Ślusarz on 15/05/2021.
//

import ComposableArchitecture
import SwiftUI

public struct HistoryView: View {
    @ObservedObject var store: Store<[Int], HistoryAction>
    
    public init(store: Store<[Int], HistoryAction>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Button("remove last value", action: {
                store.send(.removeInvoiceTapped)
            })
            .padding()
            ForEach(store.value, id: \.self) {
                Text("Result: \($0)")
            }
        }
    }
}

public enum HistoryAction {
    case removeInvoiceTapped
}

public func historyReduce(value: inout [Int], action: HistoryAction) {
    switch action {
    case .removeInvoiceTapped:
        value.removeLast()
    }
}

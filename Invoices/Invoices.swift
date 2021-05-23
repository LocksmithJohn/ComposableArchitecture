//
//  Invoices.swift
//  Invoices
//
//  Created by Jan Ślusarz on 13/05/2021.
//

import ComposableArchitecture
import Foundation
import SwiftUI

public struct InvoiceView: View {
    
    @ObservedObject var store: Store<InvoiceState, InvoiceAction>
    @State var inputText: String = ""
        
    public init(store: Store<InvoiceState, InvoiceAction>) {
        self.store = store
    }
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("", text: $inputText)
                    .font(.title)
                    .padding()
                Text(String(store.value.currentInvoiceValue))
                    .font(.title)
                    .padding()
                HStack {
                    Button("-", action: {
                        store.send(.fromGrossInvoiceTapped)
                    })
                    .padding()
                    Button("+", action: {
                        store.send(.fromNetInvoiceTapped)
                    })
                    .padding()
                }
                HStack {
                    Button("save value", action: {
                        store.send(.addedToInvoicesTapped)
                    })
                        .padding()
                    Button("remove current value", action: {
                        store.send(.removeFromInvoicesTapped)
                    })
                        .padding()
                }
                VStack {
                    ForEach(store.value.invoiceValues, id: \.self) {
                        Text("Result: \($0)")
                    }
                }
            }.navigationTitle("Ile będzie z fakturki?")
        }
    }
}


public typealias InvoiceState = (currentInvoiceValue: Int, invoiceValues: [Int])

public enum InvoiceAction {
    case fromNetInvoiceTapped
    case fromGrossInvoiceTapped
    case addedToInvoicesTapped
    case removeFromInvoicesTapped
}

public func invoiceReduce(value: inout InvoiceState, action: InvoiceAction) {
    switch action {
    case .fromNetInvoiceTapped:
        value.currentInvoiceValue += 1
    case .fromGrossInvoiceTapped:
        value.currentInvoiceValue -= 1
    case .addedToInvoicesTapped:
        value.invoiceValues.append(value.currentInvoiceValue)
    case .removeFromInvoicesTapped:
        value.invoiceValues.removeAll { $0 == value.currentInvoiceValue }
    }
}

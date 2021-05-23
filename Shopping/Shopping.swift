//
//  Shopping.swift
//  Shopping
//
//  Created by Jan Ślusarz on 13/05/2021.
//

import ComposableArchitecture
import Foundation
import SwiftUI

public struct ShoppingView: View {
    
    @State var inputText: String = ""
    @ObservedObject var store: Store<Int, ShoppingAction>
    
    public init(store: Store<Int, ShoppingAction>) {
        self.store = store
    }
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("counter:")
                Text(String(store.value))
                Button("aciton1", action: { store.send(.fromGrosTapped) })
                    .padding()
                Button("aciton2", action: { store.send(.fromNetTapped) })
                    .padding()
                Text("Ile to kosztuje na firmę?")
                    .font(.title)
                    .padding()
                TextField("", text: $inputText)
                    .font(.title)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                Text(" ")
                    .font(.title)
                    .padding()
            }.navigationTitle("Ile to na firmę?")
        }
    }
}

public enum ShoppingAction {
    case fromNetTapped
    case fromGrosTapped
}

public func shoppingReduce(value: inout Int, action: ShoppingAction) {
    switch action {
    case .fromGrosTapped:
        value -= 1
    case .fromNetTapped:
        value += 1
    }
}



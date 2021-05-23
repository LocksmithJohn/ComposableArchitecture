import SwiftUI
import Shopping
import PlaygroundSupport
import ComposableArchitecture

PlaygroundPage.current.liveView = UIHostingController(
    rootView: ShoppingView(
        store: Store<Int, ShoppingAction>(
            initialValue: 6,
            reducer: shoppingReduce
        )
    )
)

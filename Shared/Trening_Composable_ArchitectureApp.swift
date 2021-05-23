//
//  Trening_Composable_ArchitectureApp.swift
//  Shared
//
//  Created by Jan Ślusarz on 29/04/2021.
//

import ComposableArchitecture
import SwiftUI

@main
struct Trening_Composable_ArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialValue: AppState(),
                                     reducer: logging(activityFeed(appReducer))))
        }
    }
}

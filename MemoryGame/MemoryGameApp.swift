//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by user204006 on 8/11/21.
//

import SwiftUI
@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            ThemeView(viewModel: ThemeViewModel())
        }
    }
}

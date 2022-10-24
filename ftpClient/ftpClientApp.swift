//
//  ftpClientApp.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import SwiftUI

@main
struct ftpClientApp: App {

    var coordinator:AppCoordinator

    var body: some Scene {
        WindowGroup {
            ContentView(coordinator: coordinator)
        }
    }

    init() {
        
        coordinator = AppCoordinator()
    }
}

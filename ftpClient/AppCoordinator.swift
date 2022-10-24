//
//  AppCoordinator.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import Foundation
import Cocoa

class AppCoordinator {

    private (set) var hostViewModel: HostViewModel
    private (set) var connectionViewModel: ConnectionViewModel

    init() {

        hostViewModel = HostViewModel()
        connectionViewModel = ConnectionViewModel()
    }

}

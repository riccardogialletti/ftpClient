//
//  ContentView.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import SwiftUI

var listItems = ["Item 1", "Item 2", "Item 3", "Item 4"]

struct ContentView: View {

    var coordinator:AppCoordinator
    @State private var showingForm = false
    @State var select: String? = "Item 1"


    var body: some View {

        HomeView(hostViewModel: coordinator.hostViewModel,
                 connectionViewModel: coordinator.connectionViewModel)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator: AppCoordinator())
    }
}

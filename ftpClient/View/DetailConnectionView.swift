//
//  DetailConnectionView.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import Foundation
import SwiftUI

struct DetailConnectionView: View {

    var connectionEntry : HostEntry
    @ObservedObject var connectionViewModel : ConnectionViewModel

    var body: some View {

        ZStack {
            VStack(alignment:.leading) {
                if(connectionViewModel.state == .connecting) {
                    Text("Connecting to... \(connectionEntry.ip)")
                } else {
                    Text("")
                }
            }
        }
    }


}

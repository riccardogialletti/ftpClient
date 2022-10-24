//
//  HomeView.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var hostViewModel : HostViewModel
    @ObservedObject var connectionViewModel : ConnectionViewModel
    @State private var showingForm = false
    @State var select: Int? = 0
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    
                    ForEach(hostViewModel.hostEntries) { entry in
                        NavigationLink(destination: DetailConnectionView(connectionEntry: entry,
                                                                         connectionViewModel: connectionViewModel),
                                       tag: entry.idNumber,
                                       selection: $select)
                        {
                            Text(entry.serverName)
                                .padding(.vertical, 2.0)
                            
                        }
                    }
                    Spacer()
                    
                }.frame(width:160)
                    .listStyle(SidebarListStyle())
            }
            
            .toolbar {
                Button(action: {
                    if let s = select {
                        connectionViewModel.connect(to: hostViewModel.hostEntries[s])
                    }
                }) {
                    Image(systemName: "bolt.fill")
                }.disabled(connectionViewModel.state != .disconnect)
                
                
                Button(action: {
                    showingForm.toggle()
                }) {
                    Label("New connection", systemImage: "plus.circle")
                }
                .sheet(isPresented: $showingForm) {
                    AddHostView(viewModel: hostViewModel)
                }
            }
            .navigationTitle("FTP Client")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(hostViewModel: HostViewModel(),
                 connectionViewModel: ConnectionViewModel())
    }
}


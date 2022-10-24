//
//  AddConnectionView.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import Foundation
import SwiftUI

struct AddHostView: View {

    var viewModel : HostViewModel

    @State var serverName: String = ""
    @State var ip: String = ""
    @State var username: String = ""
    @State var port: String = ""
    @State var password: String = ""
    @State private var previewIndex = 0
    var previewOptions = ["FTP", "SFTP"]

    @Environment(\.dismiss) var dismiss

    var body: some View {


        Form {
            Section(header: Text("Connection").bold()) {
                TextField("Server name", text: $serverName)
                TextField("IP", text: $ip)
                TextField("Port", text: $port)
                Picker(selection: $previewIndex, label: Text("Connection type")) {
                    ForEach(0 ..< previewOptions.count) {
                        Text(self.previewOptions[$0])
                    }
                }
                /*Toggle(isOn: $isPrivate) {
                 Text("Private Account")
                 }*/
            }

            Section(header: Text("Credentials").bold()) {
                TextField("Username", text: $username)
                TextField("Password", text: $password)
            }
        }.padding(.horizontal, 24)
            .frame(width:500)
            .toolbar(content: {
                Button("Dismiss") {
                    dismiss()
                }
                .buttonStyle(.borderless)
                .foregroundColor(Color.red)
                Button("Save") {

                    let host = HostEntry(idNumber: viewModel.hostEntries.count,
                                         serverName: serverName,
                                         ip: ip,
                                         port: port,
                                         type: ConnectionEntryType(rawValue: previewOptions[previewIndex]) ?? .sftp,
                                         username: username,
                                         password: password)

                    if(viewModel.appendNewHost(hostEntry: host)) {
                        dismiss()
                    } else {
                        print("error on creating new connection")
                    }
                }
            })
    }

    
}

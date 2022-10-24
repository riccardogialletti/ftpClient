//
//  ConnectionEntry.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import Foundation
import Cocoa

enum ConnectionEntryType: String, Codable {
    case ftp = "FTP"
    case sftp = "SFTP"
}

/// Describes a filesystem entry
struct HostEntry: Codable {
    var idNumber: Int
    var serverName: String
    var ip: String
    var port: String
    var type: ConnectionEntryType
    var username: String
    var password: String
}

extension HostEntry:Identifiable {
    var id: String {
        "\(username)@\(ip)"
    }
}

extension HostEntry:Equatable {

}

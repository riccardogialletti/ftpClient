//
//  ConnectionViewModel.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 24/10/22.
//

import Foundation

class HostViewModel: ObservableObject {

    @Published var hostEntries: [HostEntry] = []

    init() {
        
        self.load()
    }

    func appendNewHost(hostEntry: HostEntry) -> Bool {

        if(!hostEntries.contains(where: { entry in
            entry.id == hostEntry.id
        })) {

            hostEntries.append(hostEntry)
            self.save()
            return true
        } else {

            return false
        }

    }

    private func load() {
        let defaults = UserDefaults.standard

        if let data = defaults.data(forKey: "connectionEntries") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                hostEntries = try decoder.decode([HostEntry].self, from: data)

            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }

    private func save() {
        let defaults = UserDefaults.standard

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(hostEntries)

            // Write/Set Data
            defaults.setValue(data, forKey: "connectionEntries")

        } catch {
            print("Unable to Encode Note (\(error))")
        }


    }
}

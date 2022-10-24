//
//  ConnectionViewModel.swift
//  ftpClient
//
//  Created by Riccardo Gialletti on 25/10/22.
//

import Foundation


enum ConnectionState: Int {

    case disconnect = 0
    case connecting = 1
    case connected = 2
}

class ConnectionViewModel: ObservableObject {

    @Published var state: ConnectionState = .disconnect

    init() {

    }

    func connect(to: HostEntry) {

        self.state = .connecting
        guard let url = URL(string: "sftp://test.rebex.net:22") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                DispatchQueue.main.async {
                    self.state = .disconnect
                }
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        //let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                        //self.users = decodedUsers
                        self.state = .connected
                    } catch let error {
                        self.state = .disconnect
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}

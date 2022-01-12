//
//  ContentView.swift
//  TestPOSTrequest
//
//  Created by Shestakov Boris on 30/09/21.
//

import SwiftUI
import Combine

//struct InputTextField {
//
//    @Binding var textBinding: String
//
//    let lable: String
//    let placeholder: String
//    let secureTextField: Bool
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(lable).font(.headline)
//            if secureTextField {
//                SecureField(placeholder, text: $textBinding)
//
//            } else {
//                TextField(placeholder, text: $textBinding)
//            }
//        }
//    }
//
//}

struct ServerMessage: Decodable {
    let message: String
}

class HttpAuth: ObservableObject {
    var didChange = PassthroughSubject<HttpAuth, Never>()
    
    var authenticated = false {
        didSet {
            didChange.send(self)
        }
    }
    
    func checkDetails(firstName: String, lastName: String, username: String, password: String) {
        guard let url = URL(string: "http://217.25.89.74:4000/users/register") else { return }
        
        let body: [String: String] = ["firstName": firstName, "lastName": lastName, "username": username, "password": password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            guard let data = data else { return }
            
            let finalData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            
            print(finalData)
            
            
        }.resume()
    }
}

struct ContentView: View {
    
    @State private var firstName: String = "firstName33"
    @State private var lastName: String = "lastName33"
    @State private var username: String = "username33"
    @State private var password: String = "password33"
    let deviceID = UIDevice.current.identifierForVendor?.uuidString
    var manager = HttpAuth()
    
    var body: some View {
        
       
        VStack(){
            Spacer()
           
        
     //   InputTextField(textBinding: $username, lable: "Username", placeholder: "Boris", //secureTextField: false)
    //    InputTextField(textBinding: $password, lable: "Password", placeholder: "P@ssw0rd", //secureTextField: true)
       
        Button(action: {
            print(self.firstName)
            print(self.lastName)
            print(self.username)
            print(self.password)
            print(deviceID!)
            
            self.manager.checkDetails(firstName: self.firstName, lastName: self.lastName, username: deviceID!, password: self.password)
            
        }, label: {
            Text("login")
        })
    }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

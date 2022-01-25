//
//  ContentView.swift
//  Confidein
//
//  Created by Shestakov Boris on 01/07/21.
//

import SwiftUI

extension UserDefaults {

    var token: String {
        get {
            return (UserDefaults.standard.value(forKey: "token") as? String) ?? "Token not receive"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "token")
        }
    }

    var id: Int {
        get {
            return (UserDefaults.standard.value(forKey: "id") as? Int) ?? 0
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "id")
        }
    }
    
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
    
}

struct ContentView: View {
    @State var inHome = false

    var body: some View {
        
        if UserDefaults.standard.welcomeScreenShown || inHome {
            Home()
        } else {
            Welcome(inHome: $inHome)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

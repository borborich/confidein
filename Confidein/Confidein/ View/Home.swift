import SwiftUI
import Combine



struct Home: View {
   
    @State private var userStatus = "Pause"
    var statuses = ["Listen", "Pause", "Talk"]
    
    var body: some View {
          VStack {
              Text("Home Screen")
              VStack {
                          Picker("What is your favorite color?", selection: $userStatus) {
                              ForEach(statuses, id: \.self) {
                                  Text($0)
                              }
                          }
                          .pickerStyle(.segmented)
                          .padding(.horizontal,30)

                          Text("Value: \(userStatus)")
                      }
          }
      }
}

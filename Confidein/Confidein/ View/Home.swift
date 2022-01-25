import SwiftUI
import Combine




struct Home: View {
   
    @State private var userStatus = "Pause"
    var statuses = ["Listen", "Pause", "Talk"]
    var managerChng = HttpAuth()
    
    var body: some View {
          VStack {
              Spacer()
              Text("Home Screen")
             
              VStack {
                  Spacer()
                  Picker("What is your favorite color?", selection: $userStatus) {
                              ForEach(statuses, id: \.self) {
                                  Text($0)
                                 
                              }
                          }
                          
                          .pickerStyle(.segmented)
                          .padding(.horizontal,30)
                  

                          Text("Value: \(userStatus)")
                
                  
                  Spacer()
                  
                  Button(action: {
                      self.managerChng.chngUserData(userStatus: "\(self.userStatus)", userBlock: "no")
                  }, label: {
                      Text("Change Your Status")
                  })
                  Spacer()
                      }
              
          }
      }


}


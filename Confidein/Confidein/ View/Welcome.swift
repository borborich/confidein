import SwiftUI
import Combine


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
    
    func checkDetails(userStatus: String, userBlock: String, username: String, password: String) {
        guard let url = URL(string: "http://217.25.89.74:4000/users/register") else { return }
        
        let body: [String: String] = ["userStatus": userStatus, "userBlock": userBlock, "username": username, "password": password]
        
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


struct Welcome: View {
    
    @AppStorage("welcomeScreenShown") // UserDefaults
    var welcomeScreenShown: Bool = false
    // To capture the current tab...
    @State private var userStatus: String = "Pause"
    @State private var userBlock: String = "0"
    
    @State private var password: String = "password"
    
    @Binding var inHome: Bool
    @State private var deviceID = UIDevice.current.identifierForVendor?.uuidString
   
    var manager = HttpAuth()
    @State var selectedTab: Trip = trips[0]
    
  

    init(inHome: Binding<Bool>) {
        self._inHome = inHome
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        ZStack{
            
           
            
            // Custom Carousel...
            
            VStack{
                
             
                // Carousel...
                
                VStack {
                    
                    GeometryReader{proxy in
                        
                        let frame = proxy.frame(in: .global)
                        
                        // Page tab View...
                        TabView(selection: $selectedTab){
                            
                            ForEach(trips){trip in
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frame.width - 70, height: frame.height - 45, alignment: .center)
                                    //.cornerRadius(4)
                                    .tag(trip)
                                   // .padding(.bottom,10)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    // max Limit
                    // half of the screen...
                    .frame(height: UIScreen.main.bounds.height / 3.3)
                    
                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top,20)
                      //  .padding(.bottom)
                    
                    Text(selectedTab.subTitle)
                        .font(.title2)
                        .fontWeight(.light)
                     //   .padding(.top,20)
                        .foregroundColor(Color.white)
                        .padding(.bottom,18)
                    
                    // Page Control From UIKit...
                    PageControl(maxPages: trips.count, currentPage: getIndex())
                }
                .padding(.top,100)
                .padding(.horizontal,10)
                .padding(.bottom,5)
                // Going to clip it using custom Shape...
               // .background(Color.gray)
                .padding(.horizontal,20)
                
                
                Spacer()
               
            
                Button(action: {
                    print(deviceID!)
                    self.inHome = true
                  
                    self.manager.checkDetails(userStatus: self.userStatus, userBlock: self.userBlock, username: deviceID!, password: self.password)
                }, label: {
                    Text("НАЧАТЬ")
                        .fontWeight(.bold)
                       
                        .foregroundColor(Color.black)
                        .padding(.vertical,18)
                        .padding(.horizontal,60)
                      //  .frame(maxWidth: .infinity)
                        .background(Color.white
                                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/))
                        .cornerRadius(50)
                })
                .padding(.top,30)
                .padding(.horizontal)
                .padding(.bottom,150)
                .onAppear(perform: {
                  UserDefaults.standard.welcomeScreenShown = true
                        })
                
                
            }
            
            
        }
        .padding(.top,0)
        .background(Color(UIColor(red: 29/255.0, green: 29/255.0, blue: 29/255.0, alpha: 1))
                        )
        .ignoresSafeArea()
        
               // .ignoresSafeArea()
    }
    
    
    // getting Index...
    func getIndex()->Int{
        
        let index = trips.firstIndex { (trip) -> Bool in
            return selectedTab.id == trip.id
        } ?? 0
        
        return index
    }
}


struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome(inHome: Binding.constant(false))
    }
}

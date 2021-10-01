import SwiftUI
import Combine

struct Home: View {
    // To capture the current tab...
    @State var selectedTab: Trip = trips[0]
    
    // disabling bounces...
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        ZStack{
            
           
            
            // Custom Carousel...
            
            VStack{
                
              //  Text("Let's Go With")
               //     .fontWeight(.bold)
               //     .foregroundColor(.white)
                
             //   Text("Pocotrip")
               //     .font(.largeTitle)
               //     .fontWeight(.heavy)
               //     .foregroundColor(.white)
               //     .padding(.bottom,30)
                
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
                                    .frame(width: frame.width - 20, height: frame.height - 45, alignment: .center)
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
               
                
                Button(action: {}, label: {
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


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

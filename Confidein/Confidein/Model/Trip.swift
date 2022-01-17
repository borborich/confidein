//
//  Trip.swift
//  Confidein
//
//  Created by Shestakov Boris on 01/07/21.
//

import SwiftUI

struct Trip: Identifiable,Hashable{
    
    var id = UUID().uuidString
    var image: String
    var title: String
    var subTitle: String

}

var trips = [

    Trip(image: "006-cancer", title: "Confidein", subTitle: "A club of anonymous friends"),
    Trip(image: "015-hamsa", title: "Confidein", subTitle: "When you need someone to talk to – this is the place"),
    Trip(image: "023-lotus", title: "Confidein", subTitle: "Be safe and cool: we do not keep not share any personal data"),
    Trip(image: "032-peace sign", title: "Confidein", subTitle: "Earn tokens by listening – use your spare time to help people"),
    
]

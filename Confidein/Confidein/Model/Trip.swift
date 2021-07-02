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

    Trip(image: "006-cancer", title: "Confidein1", subTitle: "Это клуб анонимных друзей"),
    Trip(image: "015-hamsa", title: "Confidein2", subTitle: "Когда вам нескем поговорить – здесь вас выслушают"),
    Trip(image: "023-lotus", title: "Confidein3", subTitle: "Безопасность и анонимность – мы не узнаем ни каких ваших данных"),
    Trip(image: "032-peace sign", title: "Confidein4", subTitle: "Получайте награды за роль слушателя"),
    
]

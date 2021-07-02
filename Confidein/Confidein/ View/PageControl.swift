//
//  PageControl.swift
//  Confidein
//
//  Created by Shestakov Boris on 01/07/21.
//

import SwiftUI

struct PageControl: UIViewRepresentable {

    var maxPages: Int
    var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.numberOfPages = maxPages
        control.currentPage = currentPage
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        // updating current Page...
        uiView.currentPage = currentPage
    }
}

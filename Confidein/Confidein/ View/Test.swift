//
//  Test.swift
//  Confidein
//
//  Created by Shestakov Boris on 13/12/21.
//

import Foundation
import UIKit

class Test: UIViewController {
    
    var message:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call objective-c class method directly.
        TestObjectiveCClass.printHello()
        
        // Create an instance of objective-c class.
        let testObject:TestObjectiveCClass = TestObjectiveCClass()
        
        // Invoke the objective-c class's instance method.
        message = testObject.sayHello()

        // Print the message in Xcode debug console.
        print(message)
    
    }
   
}

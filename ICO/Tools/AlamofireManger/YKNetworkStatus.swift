//
//  YKNetworkStatus.swift
//  ICO
//
//  Created by yunke on 2018/1/25.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit
import Alamofire

class YKNetworkStatus :NSObject{
   
        static let sharedInstance = YKNetworkStatus()
    var isConnect: Bool? {
        didSet{
            print(isConnect as Any)
        }
    }
    


    
          let reachabilityManager = NetworkReachabilityManager()
        func startNetworkReachabilityObserver() {
  
                        reachabilityManager?.listener = { status in
       
                            switch status {

                            case .notReachable:
                                self.isConnect = false
                                print("The network is not reachable")

                            case .unknown :
                                print("It is unknown whether the network is reachable")
                                self.isConnect = false
                            case .reachable(.ethernetOrWiFi):
                                print("The network is reachable over the WiFi connection")
                                self.isConnect = true
                            case .reachable(.wwan):
                                print("The network is reachable over the WWAN connection")
                                self.isConnect = true

                            }
                        }
            reachabilityManager?.startListening()
}
    
    
    
    
}



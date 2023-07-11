//
//  APICaller.swift
//  testcall
//
//  Created by macbook pro on 10.07.2023.
//

import Foundation
import Alamofire

func APICaller(_ toNumber: String?) {
    
    let accountSID = "xxx"
    let authToken = "xxx"
    
    let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Calls"
    let parameters = ["From": "+12176287050", "To": "\(toNumber ?? "")", "Url": "https://handler.twilio.com/twiml/EHa3d6efedfa3d45e34cdc2415082ed73e"]
    
    AF.request(url, method: .post, parameters: parameters)
        .authenticate(username: accountSID, password: authToken)
        .responseJSON { response in
            debugPrint(response)
        }
    
    RunLoop.main.run()
    
    
    
}

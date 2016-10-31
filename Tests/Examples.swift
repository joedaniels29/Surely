//
//  Examples.swift
//  Surely
//
//  Created by joe on 10/30/16.
//  Copyright © 2016 Károly Lőrentey. All rights reserved.
//

import Foundation


class WebRequestSurely: SurelyOperation{
    var url : URL
    
    required init?(coder aDecoder: NSCoder) {
        url = aDecoder.decodeObject(forKey: "URL") as! URL
        super.init(coder: aDecoder)
    }
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(url, forKey: "URL")
        
    }
    static var a:[String : (WebRequestSurely) -> Any]{
    	return ["a":WebRequestSurely.encode]
    }
    
}

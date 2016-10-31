//
//  Implementation.swift
//  Surely
//
//  Created by Károly Lőrentey on 2016-03-08.
//  Copyright © 2016 Károly Lőrentey.
//
import Foundation

class SurelyOperationQueue:OperationQueue, NSCoding{
    var docs: URL{
        return URL(string:NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])!
    }
    var surelyDocs:URL{
        return docs.appendingPathComponent("surely")
    }
    var fm:FileManager = FileManager.default
    var url :URL{
        return surelyDocs.appendingPathComponent(name!)
    }
    init(named:String) {
        super.init()
        name = named
    }
    required init?(coder aDecoder: NSCoder) {
        super.init()
        name = aDecoder.decodeObject(forKey: "name") as? String ??  "ERROR NAME"

    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name , forKey:"name")
    }
    
    func save(){
        do {
     	   if !fm.fileExists(atPath: surelyDocs.path){
     	       try fm.createDirectory(at: surelyDocs, withIntermediateDirectories: true)
    	    }
     	   if fm.fileExists(atPath: url.path){
            	try fm.removeItem(at: url)
        	}
        	NSKeyedArchiver.archiveRootObject(self, toFile: url.path )
        } catch {
            print(error)
        }
    }
}



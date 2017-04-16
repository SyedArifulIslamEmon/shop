//
//  DataService.swift
//  Shop
//
//  Created by Roland Michelberger on 16.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import Foundation

class DataService {
    
    /**
     * Get data from URL
     * @param url: URL where to get the data from
     * @param completion: the completion block with the result, called on a background thread
     * @return NSURLSessionDataTask, to be able to cancel the network call
     */
    class func getData(from url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: NSError?) -> Void) -> URLSessionDataTask? {
        
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: completion as! (Data?, URLResponse?, Error?) -> Void)
        // start download
        dataTask.resume()
        
        return dataTask
    }
    
}

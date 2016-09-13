//
//  APIController.swift
//  Albums
//
//  Created by Ben Gohlke on 9/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

protocol APIControllerProtocol
{
    func didReceiveAPIResults(_ results: [Any])
}

class APIController
{
    
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func searchItunesFor(_ searchTerm: String)
    {
        let itunesSearchTerm = searchTerm.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.caseInsensitive, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
        {
            let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music&entity=album"
            let url = URL(string: urlPath)
            let session = URLSession.shared
            let task = session.dataTask(with: url!, completionHandler: {data, response, error -> Void in
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                if let dictionary = self.parseJSON(data!)
                {
                    if let results = dictionary["results"] as? [Any]
                    {
                        self.delegate.didReceiveAPIResults(results)
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [String: Any]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any]
            {
                return dictionary
            }
            else
            {
                return nil
            }
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}

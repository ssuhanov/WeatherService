//
//  Networking.swift
//  WeatherService
//
//  Created by Serge Sukhanov on 2/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

enum ServerResponse {
    case wrongRequest
    case success (data: JSONDictonary?)
    case failure (error: Error)
}

struct StatusCode {
    var rawValue: Int
    
    init?(rawValue: Int?) {
        guard let rawValue = rawValue else {
            return nil
        }
        
        self.rawValue = rawValue
    }
}

typealias JSONDictonary = [String : AnyObject]
typealias ResponseResultCompletion = (ServerResponse, StatusCode?) -> Void
typealias Response = (data: Data?, response: URLResponse?, error: Error?)

enum Networking {}

extension Networking {
    
    typealias ResponseDictionary = (responseResult: JSONDictonary?, isCancelled: Bool)
    
    static func dictionaryRequestGET(withURL URLString: String,
                                     parameters: JSONDictonary?,
                                     andCompletion completion: ResponseResultCompletion?) {
        
        guard let request = requestGET(withURL: URLString, andParameters: parameters) else {
            completion?(.wrongRequest, nil)
            return
        }
        
        serverRequest(request) { data, response, error in
            let serverResponse: ServerResponse
            
            if let error = error {
                serverResponse = .failure(error: error)
            } else {
                serverResponse = .success(data: json(from: data) as? JSONDictonary)
            }
            
            let rawValueStatusCode = (response as? HTTPURLResponse)?.statusCode
            let statusCode = StatusCode(rawValue: rawValueStatusCode)
            completion?(serverResponse, statusCode)
        }
    }
    
    static func serverRequest(_ request: URLRequest, andCompletion completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let newTask = URLSession.shared.dataTask(with: request, completionHandler: completion)
        newTask.resume()
    }
    
    static func requestGET(withURL URLString: String, andParameters parameters: JSONDictonary?) -> URLRequest? {
        guard let _ = URL(string: URLString) else {
            return nil
        }
        
        let parametersString = parameters?.stringFromHttpParameters() ?? ""
        guard let url = URL(string: "\(URLString)?\(parametersString)") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    static func json(from data: Data?) -> Any? {
        guard let data = data else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: [])
    }
    
}

extension String {
    
    /// Percent escapes values to be added to a URL query as specified in RFC 3986
    ///
    /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "~".
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: Returns percent-escaped string.
    
    func stringByAddingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
    
}

extension Dictionary {
    
    /// Build string representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).stringByAddingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).stringByAddingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
    
}

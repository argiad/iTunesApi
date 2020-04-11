//
//  File.swift
//  
//
//  Created by Artem Mkrtchyan on 4/10/20.
//

import Foundation


class iTunesRequestManager {
    
    private let delegate = iTunesApi.shared.delegate
    
    func search(by request: iTunesSearchRequest) {
        if let  urlRequest = createUrlRequest(request) {
            sendRequest(urlRequest)
        } else {
            iTunesApi.shared.delegate?.error() // need to fix
            return
        }
    }
    
    private func createUrlRequest(_ request: iTunesSearchRequest) -> URLRequest? {
        if var components = URLComponents(string: Constants.iTunesPath + Constants.iTunesPathSearchComponent){
            components.queryItems = request.parameters
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            return URLRequest(url: components.url!)
        }
        return nil
    }
    
    
    private func sendRequest(_ urlRequest: URLRequest) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = Constants.requestTimeOut
        
        let task = URLSession(configuration: sessionConfig).shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    self.delegate?.error()        // need to fix
                    return
            }
            
            DispatchQueue.main.async {
                if let result  = try? JSONDecoder().decode(iTunesResponse.self, from: data)  {
                    self.delegate?.response(result)
                } else {
                    self.delegate?.error() // TODO !!!!!
                }
            }
            
        }
        task.resume()
    }
    
}


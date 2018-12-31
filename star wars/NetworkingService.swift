//
//  NetworkingService.swift
//  star wars
//
//  Created by Muhammad Faisal Imran Khan on 31/12/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetworkingService{
    static let shared = NetworkingService()
    private init(){}
    
    func getPeople(success successBlock: @escaping (GetPeopleResponse) -> Void) {
        AF.request("https://swapi.co/api/people/").responseJSON {response in
            guard let json = response.result.value as? JSON else {return}
            do{
                let getPeopleResponse = try GetPeopleResponse(json: json)
                successBlock(getPeopleResponse)
            }catch{
                
            }
        }
        
    }
    
    func getHomeworld(homeworldlink: String, completion: @escaping (String) -> Void){
        AF.request(homeworldlink).responseJSON{(response) in
            guard let json = response.result.value as? JSON ,
                let name = json["name"] as? String else { print("NOPE"); return }
            print("GOT HERE")
            completion(name)
            
        }
        
    }
}

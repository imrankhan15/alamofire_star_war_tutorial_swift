//
//  GetPeopleResponse.swift
//  star wars
//
//  Created by Muhammad Faisal Imran Khan on 31/12/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import Foundation

struct GetPeopleResponse {
    let people: [Person]
    init(json: JSON) throws {
        guard let results = json["results"] as? [JSON] else {
            throw NetworkingError.badNetworkingStuff
        }
        let people = results.map{Person(json: $0)  }.flatMap{$0}
        self.people = people
    }
}

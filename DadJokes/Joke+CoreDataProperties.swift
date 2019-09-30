//
//  Joke+CoreDataProperties.swift
//  DadJokes
//
//  Created by Joseph Caligiuri on 9/30/19.
//  Copyright © 2019 Joseph Caligiuri. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var setup: String
    @NSManaged public var punchline: String
    @NSManaged public var rating: String

}

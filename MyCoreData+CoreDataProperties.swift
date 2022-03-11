//
//  MyCoreData+CoreDataProperties.swift
//  
//
//  Created by 廖翔 on 2022/3/5.
//
//

import Foundation
import CoreData


extension MyCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyCoreData> {
        return NSFetchRequest<MyCoreData>(entityName: "MyCoreData")
    }

    @NSManaged public var myCoreData: String?

}

//
//  Big3Entity+CoreDataProperties.swift
//  筋トレビック3
//
//  Created by  on 2016/12/29.
//  Copyright © 2016年 . All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Big3Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Big3Entity> {
        return NSFetchRequest<Big3Entity>(entityName: "Big3Entity");
    }

    @NSManaged public var date: String?
    @NSManaged public var big3: String?
    @NSManaged public var maxweight: String?

}

//
//  Vehicule+CoreDataProperties.swift
//  ios.project1
//
//  Created by Patrick Moniqui on 17-10-11.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation
import CoreData


extension VehiculeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VehiculeEntity> {
        return NSFetchRequest<VehiculeEntity>(entityName: "Vehicule")
    }

    @NSManaged public var annee: Int32
    @NSManaged public var marque: String?
    @NSManaged public var modele: String?
    @NSManaged public var odometre: Int32
    @NSManaged public var nbPortiere: Int32
    @NSManaged public var couleurEx: String?
    @NSManaged public var couleurInt: String?
    @NSManaged public var typeTransmission: String?
    @NSManaged public var nbCylindre: Int32
    @NSManaged public var options: String?

}

//
//  VehiculeService.swift
//  ios.project1
//
//  Created by Patrick Moniqui on 17-10-11.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation
import CoreData

class VehiculeDao {
    
    private func MapEntityToModel(entity: VehiculeEntity) -> Vehicule
    {
        let model : Vehicule = Vehicule()
        
        model.annee = entity.annee
        model.marque = entity.marque!
        model.modele = entity.modele!
        model.odometre = entity.odometre
        model.nbPortiere = entity.nbPortiere
        model.couleurEx = entity.couleurEx!
        model.couleurInt = entity.couleurInt!
        model.typeTransmission = entity.typeTransmission!
        model.nbCylindre = entity.nbCylindre
        model.options = (entity.options?.components(separatedBy: ";"))!
        
        return model
    }
    
    private func MapListEntityToListModel(entityList: [VehiculeEntity]) -> [Vehicule]
    {
        var model : [Vehicule] = [Vehicule]()
        
        for m in entityList {
            model.append(MapEntityToModel(entity: m))
        }
        
        return model
    }
    
    // MARK: - Get all vehicules

    func GetVehiculeList() -> [Vehicule] {
        
        
        let context = self.getContext()
        let request : NSFetchRequest<VehiculeEntity> = VehiculeEntity.fetchRequest()
        
        do {
            let _ : [Vehicule] = [Vehicule]()
            let vehiculesEntity = try context.fetch(request)
            
            if(vehiculesEntity.count > 0)
            {
                return MapListEntityToListModel(entityList: vehiculesEntity)
            }
        }
        catch
        {
            print("Error fetching ")
        }
        
        return [Vehicule]()
    }
    
    // MARK: - Delete all vehicule
    func DeleteAllVehicule()
    {
        let context = self.getContext()

        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Vehicule")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try context.execute(request)
            try context.save()
        }
        catch
        {
            print("Error deleting,, ")
        }

    }

    // MARK: - Add vehicule
    func AddVehicule(vehicule: Vehicule) {
        
        let context = self.getContext()
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Vehicule", into: context)
        
        newEntity.setValue(vehicule.annee, forKey: "annee")
        newEntity.setValue(vehicule.marque, forKey: "marque")
        newEntity.setValue(vehicule.modele, forKey: "modele")
        newEntity.setValue(vehicule.odometre, forKey: "odometre")
        newEntity.setValue(vehicule.nbPortiere, forKey: "nbPortiere")
        newEntity.setValue(vehicule.couleurEx, forKey: "couleurEx")
        newEntity.setValue(vehicule.couleurInt, forKey: "couleurInt")
        newEntity.setValue(vehicule.typeTransmission, forKey: "typeTransmission")
        newEntity.setValue(vehicule.nbCylindre, forKey: "nbCylindre")
        newEntity.setValue(vehicule.options.joined(separator: ";"), forKey: "options")
        
        do {
            try context.save()
            print("vehicule successfully added")
        }
        catch {
            print("Error while inserting vehicule")
        }
        
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "ios.project1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    
    // MARK: - Core Data Get Context
    func getContext() -> NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = self.getContext()
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

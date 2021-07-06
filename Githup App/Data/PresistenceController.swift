//
//  PresistenceController.swift
//  Githup App
//
//  Created by Danang Wijaya on 06/07/21.
//

import Foundation
import CoreData
struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        return controller
    }()
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FavouriteUser")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(){
        let context = container.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                
            }
        }
    }
    func checkData(data: UserModel)->Bool{
        var result = false
        let context = container.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "FavouriteUser")
        fetchRequest.predicate =  NSPredicate(format: "login = %@", data.login)
        do{
            let test = try context.fetch(fetchRequest)
            if test.count == 1 {
                result = true
            }
        }catch{
            print(error)
        }
        return result
    }
    func addFavourite(data: UserModel){
        let user = FavouriteUser(context: container.viewContext)
        user.avatar_url = data.avatar_url
        user.id = Int32(data.id)
        user.login = data.login
        user.type = data.type
        user.url = data.url
        save()
    }
    func removeFavourite(data: UserModel) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "FavouriteUser")
        fetchRequest.predicate =  NSPredicate(format: "login = %@", data.login)
        if let result = try? container.viewContext.fetch(fetchRequest){
            for object in result{
                container.viewContext.delete(object as! NSManagedObject)
            }
        }
       
    }
}

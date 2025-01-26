//
//  EventViewModel.swift
//  Jackpass
//
//  Created by Praveen Sehgal on 24/01/2025.
//

import SwiftUI
import CoreData

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    private let context = PersistenceController.shared.container.viewContext
    
    func fetchEvents() {
        let request: NSFetchRequest<EventEntity> = EventEntity.fetchRequest()
        do {
            let fetchedEntities = try context.fetch(request)
            self.events = fetchedEntities.map { entity in
                Event(
                    id: entity.id ?? UUID(),
                    title: entity.title ?? "",
                    date: entity.date ?? Date(),
                    location: entity.location ?? "",
                    description: entity.descriptionText ?? "",
                    mediaPath: entity.mediaPath
                )
            }
        } catch {
            print("Error fetching events: \(error)")
        }
    }
    
    func saveEvent(_ event: Event) {
        let newEntity = EventEntity(context: context)
        newEntity.id = event.id
        newEntity.title = event.title
        newEntity.date = event.date
        newEntity.location = event.location
        newEntity.descriptionText = event.description
        newEntity.mediaPath = event.mediaPath
        
        do {
            try context.save()
            fetchEvents()
        } catch {
            print("Error saving event: \(error)")
        }
    }
}


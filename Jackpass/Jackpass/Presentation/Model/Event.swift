//
//  Event.swift
//  Jackpass
//
//  Created by Praveen Sehgal on 24/01/2025.
//

import Foundation

struct Event: Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var location: String
    var description: String
    var mediaPath: String?
}

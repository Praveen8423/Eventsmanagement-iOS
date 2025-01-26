//
//  EventCreationView.swift
//  Jackpass
//
//  Created by Praveen Sehgal on 24/01/2025.
//

import SwiftUI
import PhotosUI

struct EventCreationView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: EventViewModel
    
    @State private var title = ""
    @State private var date = Date()
    @State private var location = ""
    @State private var description = ""
    @State private var selectedMedia: UIImage?
    @State private var mediaPath: String?
    
    @State private var showMediaPicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Event Details")) {
                    TextField("Title", text: $title)
                    DatePicker("Date & Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                    TextField("Location", text: $location)
                    TextEditor(text: $description)
                        .frame(height: 100)
                }
                
                Section(header: Text("Media")) {
                    if let selectedMedia = selectedMedia {
                        Image(uiImage: selectedMedia)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                    } else {
                        Button("Select Media") {
                            showMediaPicker = true
                        }
                    }
                }
            }
            .navigationBarTitle("Create Event", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                saveEvent()
            })
            .sheet(isPresented: $showMediaPicker) {
                MediaPicker(selectedImage: $selectedMedia, mediaPath: $mediaPath)
            }
        }
    }
    
    private func saveEvent() {
        guard !title.isEmpty, !location.isEmpty else { return }
        
        let newEvent = Event(
            id: UUID(),
            title: title,
            date: date,
            location: location,
            description: description,
            mediaPath: mediaPath
        )
        
        viewModel.saveEvent(newEvent)
        presentationMode.wrappedValue.dismiss()
    }
}

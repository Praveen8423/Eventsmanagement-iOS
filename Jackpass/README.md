# Eventsmanagement-iOS
It is an event management application built using SwiftUI and Core Data. It allows users to create and view events, with the ability to attach media (images) to each event. The application is designed with a clean and modern user interface.

Features:
1. Create Events: Allows users to create events with a title, date, location, and description.
2. Attach Media: Users can select images from their device to attach to an event.
3. View Events: Displays a list of events in a grid format with images and event details.
4. Core Data Integration: Events are persisted using Core Data, allowing them to remain across app launches.

Requirements:
iOS 14.0 or later
SwiftUI
Core Data
PHPicker for media selection

Project Structure:
- PersistenceController: Manages the Core Data stack and stores the events.
- EventViewModel: Handles the business logic for fetching, saving, and updating events.
- Event: A model struct representing an event, with properties such as title, date, location, and media path.
- EventCreationView: A SwiftUI view for creating a new event. It includes text fields for event details and an image picker for selecting media.
- EventListView: Displays the list of events in a grid layout, showing event details and images.
- MediaPicker: A custom SwiftUI component that allows users to pick images from their photo library.

Usage:
1. Create an Event: Tap the "Add Event" button in the navigation bar. Enter the event details (title, location, description), and select an image for the event.
2. View Events: The event list will display all saved events, with their associated images (if any).
3. Save Events: After creating an event, tap the "Save" button, and the event will be stored in Core Data.

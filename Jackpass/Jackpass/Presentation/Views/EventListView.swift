////
////  EventListView.swift
////  Jackpass
////
////  Created by Praveen Sehgal on 24/01/2025.
////
//import SwiftUI
//
//struct EventListView: View {
//    @StateObject private var viewModel = EventViewModel()
//    @State private var showCreationView = false
//    
//    var body: some View {
//        NavigationView {
//            List(viewModel.events) { event in
//                HStack {
//                    if let mediaPath = event.mediaPath, let image = UIImage(contentsOfFile: mediaPath) {
//                        Image(uiImage: image)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 50, height: 50)
//                            .clipShape(RoundedRectangle(cornerRadius: 8))
//                    }
//                    
//                    VStack(alignment: .leading) {
//                        Text(event.title)
//                            .font(.headline)
//                        Text(event.date, style: .date)
//                            .font(.subheadline)
//                    }
//                }
//            }
//            .navigationBarTitle("Events")
//            .navigationBarItems(trailing: Button("Add Event") {
//                showCreationView = true
//            })
//            .sheet(isPresented: $showCreationView) {
//                EventCreationView(viewModel: viewModel)
//            }
//            .onAppear {
//                viewModel.fetchEvents()
//            }
//        }
//    }
//}

//
//  EventListView.swift
//  Jackpass
//
//  Created by Praveen Sehgal on 24/01/2025.
//
import SwiftUI

struct EventListView: View {
    @StateObject private var viewModel = EventViewModel()
    @State private var showCreationView = false
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.events) { event in
                        VStack(alignment: .leading, spacing: 8) {
                            if let mediaPath = event.mediaPath, let image = UIImage(contentsOfFile: mediaPath) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                    .clipped()
                                    .cornerRadius(10)
                            } else {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 150)
                                    .cornerRadius(10)
                                    .overlay(
                                        Text("No Media")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    )
                            }
                            
                            Text(event.title)
                                .font(.headline)
                                .lineLimit(1)
                            
                            Text(event.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Events")
            .navigationBarItems(trailing: Button("Add Event") {
                showCreationView = true
            })
            .sheet(isPresented: $showCreationView) {
                EventCreationView(viewModel: viewModel)
            }
            .onAppear {
                viewModel.fetchEvents()
            }
        }
    }
}

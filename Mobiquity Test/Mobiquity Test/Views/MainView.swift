//
//  MainView.swift
//  Mobiquity Test
//
//  Created by Ross Viviani on 15/02/2024.
//

import SwiftUI
import Shared

struct MainView: View {
    
    let service: DataService
    @State var imageURLs: [URL] = []
    @State private var searchText = ""

    var body: some View {
        
        NavigationView(content: {
            ScrollView {
                VStack(alignment: .center, content: {
                    VStack(alignment: .leading) {
                        
                        NavigationLink("History",
                                       destination: HistoryView())
                        .padding()
                        .buttonStyle(.borderedProminent)
                    }
                     
                    LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 20) {
                        
                        ForEach(imageURLs, id: \.self) { item in

                            AsyncImage(url: item) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .clipped()
                        }
                    }
                    
                    Spacer()
                })
                .searchable(text: $searchText, prompt: "What would you like to search for?")
                .navigationTitle("Flickr Search")
                .onSubmit(of: .search) {
                    
                    Task {
                        
                        guard let url = service.search(phrase: searchText) else {
                            return
                        }
                
                        switch await service.dataRequest(request: url) {
                        case .success(let success):
                            imageURLs = success.urlImageRequests()
                        case .failure(let failure):
                            print(failure)
                        }
                        
                        HistoryViewDataModel.history.append(.init(title: searchText))
                    }
                }
                .scaledToFit()
            }
        })
        .padding([.horizontal], 10)
    }
}

#Preview {
    MainView(service: .init(buildType: .development))
}

//
//  ListView.swift
//  bark
//
//  Created by Anagha K J on 10/01/24.
//

import SwiftUI

struct ListView: View {
    @StateObject var listVM = ListVM()
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(listVM.dogs, id: \.self.id) { dog in
                    BreedView(dog: dog)
                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                .padding(0)
            }
            .task {
                await listVM.getBreeds(limit: 10, page: 0)
        }
            .navigationTitle("Breeds")
        } detail: {
            Text("Select a breed")
        }
    }
}
#Preview {
    ListView()
}

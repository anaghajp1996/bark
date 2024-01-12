//
//  ListView.swift
//  bark
//
//  Created by Anagha K J on 10/01/24.
//

import SwiftUI

struct ListView: View {
    @StateObject var listVM = ListVM()
    @State var openSheet = false
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
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Label("", systemImage: "pawprint.fill")
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        openSheet = true
                    } label: {
                        Text("Upgrade")
                    }.sheet(isPresented: $openSheet, content: {
                        VStack(alignment: .trailing) {
                            Button {
                                openSheet = false
                            } label: {
                                Label("", systemImage: "xmark")
                            }.padding()
                            Spacer()
                            Carosel()
                            Spacer()
                        }
                    })
                }
            }
        } detail: {
            Text("Select a breed")
        }
    }
}
#Preview {
    ListView()
}

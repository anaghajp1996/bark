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
    @State private var limit = 10
    @State private var page = 0
    @State private var isLast = false
    @State var list = Array(0...10)
    var body: some View {
        NavigationStack() {
            ZStack {
                List {
                    ForEach(listVM.dogs, id: \.self) { dog in
                        BreedView(dog: dog)
                            .onAppear() {
                                if(dog == listVM.dogs.last) {
                                    Task {
                                        if limit < 100 {
                                            limit += 10
                                            page += 1
                                            await listVM.getBreeds(limit: limit, page: page)
                                        }
                                    }
                                }
                            }
                    }
                }
                .task {
                    await listVM.getBreeds(limit: limit, page: page)
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
                listVM.isLoading ? AnyView(ProgressView()) : AnyView(EmptyView())
            }
        }
    }
}
//#Preview {
//    ListView(path: [])
//}

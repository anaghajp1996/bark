//
//  DogDetailView.swift
//  bark
//
//  Created by Anagha K J on 11/01/24.
//

import SwiftUI

struct BreedDetailView: View {
    let dog: Dog
    let imageURL: String?
    @StateObject var breedDetailVM = BreedDetailVM()
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImageView(url: imageURL)
                .frame(width: .infinity, height: 200)
                .cornerRadius(20)
            Text(dog.name ?? "N/A").font(.title).fontWeight(.heavy)
            VStack(alignment: .leading, spacing: 12) {
                KeyValuePairs(key: "Bred For", value: dog.bred_for ?? "N/A")
                KeyValuePairs(key: "Breed Group", value: breedDetailVM.breedDetail?.breed_group ?? "N/A")
                KeyValuePairs(key: "Life Span", value: breedDetailVM.breedDetail?.life_span ?? "N/A")
                KeyValuePairs(key: "Origin", value: breedDetailVM.breedDetail?.origin ?? "N/A")
            }
            Spacer()
        }.padding()
            .task {
                if let id = dog.id {
                    await breedDetailVM.getBreedDetail(id: id)
                }
            }
    }
}

#Preview {
    BreedDetailView(dog: Dog(id: 1, name: "Breed", reference_image_id: "1-7cgoZSh", bred_for: "Hunting"), imageURL: "https://cdn2.thedogapi.com/images/1-7cgoZSh.jpg")
}

struct KeyValuePairs: View {
    let key: String
    let value: String
    var body: some View {
        HStack {
            Text(key).fontWeight(.bold)
            Spacer()
            Text(value).multilineTextAlignment(.trailing)
        }
    }
}

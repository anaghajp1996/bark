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
    var body: some View {
        AsyncImageView(url: imageURL)
            .frame(width: .infinity, height: 200)
            .cornerRadius(20)
            .padding()
    }
}

#Preview {
    BreedDetailView(dog: Dog(id: 1, name: "Breed", reference_image_id: "1-7cgoZSh", bred_for: "Hunting"), imageURL: "https://cdn2.thedogapi.com/images/1-7cgoZSh.jpg")
}

//
//  CardView.swift
//  bark
//
//  Created by Anagha K J on 10/01/24.
//

import SwiftUI

struct CardView: View {
    let dog: Dog
    @StateObject var imageVM = ImageVM()
    var body: some View {
        
        NavigationLink {
            DogDetailView(dog: dog, imageURL: imageVM.image?.url)
        } label: {
            HStack {
                AsyncImageView(url: imageVM.image?.url)
                    .frame(width: 60, height: 50)
                VStack(alignment: .leading) {
                    Text(dog.name ?? "N/A")
                        .foregroundStyle(blue)
                        .fontWeight(.heavy)
                    dog.bred_for == nil ? AnyView(EmptyView()) : AnyView(
                        Text("Bred For: \(dog.bred_for!)")
                            .foregroundStyle(blue)
                            .multilineTextAlignment(.leading))
                }
                Spacer()
            }
            .cornerRadius(5)
            .task {
                await imageVM.getImage(id: dog.reference_image_id ?? "")
            }
        }
    }
}

#Preview {
    CardView(dog: Dog(id: 1, name: "Breed name", reference_image_id: "BJa4kxc4X", bred_for: "Alphanso"))
}

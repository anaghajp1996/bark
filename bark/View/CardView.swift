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
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(dog.name ?? "N/A")
                    .font(.largeTitle)
                    .foregroundStyle(blue)
                    .fontWeight(.heavy)
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: imageVM.image?.url ?? "https://upload.wikimedia.org/wikipedia/commons/c/c0/Dog_Paw_Print.png")) { image in
                       image
                           .resizable()
                           
                           .clipShape(.rect(cornerRadii: RectangleCornerRadii.init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 20)))
                    } placeholder: {
                        HStack {
                           Spacer()
                           ProgressView().scaleEffect(2).padding()
                               .progressViewStyle(CircularProgressViewStyle())
                           Spacer()
                        }
                    }
                    .frame(width: 200, height: 200)
                   .padding(.top)
                    Spacer()
                }
            }
        }
        .padding(16)
        
        .background(
            LinearGradient(gradient: Gradient(colors: [cream, lightPink]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .task {
            await imageVM.getImage(id: dog.reference_image_id ?? "")
        }
    }
}

#Preview {
    CardView(dog: Dog(id: 1, name: "Breed name", reference_image_id: "BJa4kxc4X", bred_for: "ALphanso"))
}

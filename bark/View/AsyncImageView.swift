//
//  AsyncImage.swift
//  bark
//
//  Created by Anagha K J on 11/01/24.
//

import SwiftUI

struct AsyncImageView: View {
    let url: String?
    var body: some View {
        AsyncImage(url: URL(string: url ?? "https://upload.wikimedia.org/wikipedia/commons/c/c0/Dog_Paw_Print.png")) { image in
            image
                .resizable()
        } placeholder: {
            HStack {
                Spacer()
                ProgressView().padding()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }
    }
}

#Preview {
    AsyncImageView(url: "")
}

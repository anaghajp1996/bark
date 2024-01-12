//
//  Carosel.swift
//  bark
//
//  Created by Anagha K J on 12/01/24.
//

import SwiftUI

struct Card {
    let id: Int
    let title: String
    let description: String
    let price: Double
}

struct Carosel: View {
    var body: some View {
        let cards = [
            Card(id: 1, title: "Basic", description: "Our basic plan lets you go through all dog breeds.", price: 0.0),
            Card(id: 2, title: "Premium", description: "You can look up dogs to adopt!", price: 4.99),
            Card(id: 3, title: "Gold", description: "Adopt dogs, and shop for them!", price: 11.99)
        ]
        @State var selectedTab = 0
            ZStack(alignment: .bottom) {
                TabView {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page)
                .padding()
            }.frame(height: 400)
    }
}

#Preview {
    Carosel()
}

struct CardView: View {
    let card: Card
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [ lightPink, pink, cream]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
            VStack() {
                Spacer()
                Text(card.title).font(.title).fontWeight(.bold)
                Text(card.description).font(.subheadline).fontWeight(.bold).multilineTextAlignment(.center)
                Spacer()
                Text("$ \(card.price, specifier: "%.2f")").font(.largeTitle).fontWeight(.heavy)
                Spacer()
                Button {
                    
                } label: {
                    Text("Get Plan")
                        .padding()
                        .tint(.white)
                }
                .background(blue)
                .cornerRadius(5)
                Spacer()
            }.padding()
        }
    }
}

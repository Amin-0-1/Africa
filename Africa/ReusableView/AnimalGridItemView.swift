//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Amin on 29/11/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    private let animals: [Animal] = Bundle.main.decode("animals.json")
    let animal: Animal?
    var body: some View {
        if let image = animal?.image {
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 12))
        }
    }
}

#Preview {
    AnimalGridItemView(animal: Animal.firstAnimal())
}

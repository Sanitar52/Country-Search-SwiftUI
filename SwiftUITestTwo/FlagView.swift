//
//  FlagView.swift
//  SwiftUITestTwo
//
//  Created by Finartz on 13.08.2024.
//

import SwiftUI

struct FlagView: View {
    var country: CountriesSearch
    var body: some View {
            AsyncImage(url: URL(string: country.flags?.png ?? "https://t3.ftcdn.net/jpg/04/60/01/36/360_F_460013622_6xF8uN6ubMvLx0tAJECBHfKPoNOR5cRa.jpg")) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo").font(.largeTitle)
                case .success(let image):
                    image.resizable()
                default:
                    ProgressView()
                }
            }
            .frame(width: 50, height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(country.name?.official ?? "Unknown").bold().font(.title3)
                if let capital = country.capital?.first {
                    Text("Capital: \(capital)").font(.subheadline)
                }
                if let population = country.population {
                    Text("Population: \(population)").font(.subheadline)
                }
            }
    }
}

import SwiftUI
import MapKit

struct CountryDetailView: View {
    var country: CountriesSearch

    var body: some View {
        VStack {
            Text(country.name?.official ?? "Country Details").fontWeight(.heavy)
            AsyncImage(url: URL(string: country.flags?.png ?? "")) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo").font(.title2)
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                default:
                    ProgressView()
                }
                if let capital = country.capital?.first {
                    HStack {
                        Text("Capital:").bold()
                        Text(capital)
                    }
                }
                if let population = country.population {
                    HStack {
                        Text("Population:").bold()
                        Text(population.description)
                    }
                }
                Spacer()
                Divider()
                
            }
            .padding()
            

            // Map View
            MapView(latitude: country.latlng?.first ?? 0, longitude: country.latlng?.last ?? 0)
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

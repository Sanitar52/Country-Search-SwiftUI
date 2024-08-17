import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CountriesViewModel()
    
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredCountries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    HStack {
                        FlagView(country: country)
                    }
                }
                
            }
            .shadow(color: Color.customGray, radius: 50)
            .listRowSpacing(1)
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Countries")
            .onAppear {
                viewModel.getCountries()
            }
            
        }.ignoresSafeArea(.all)
    }
    
}

#Preview {
    ContentView()
}
extension Color {
    static let customGray = Color(red: 242.0, green: 242.0, blue: 247.0) // RGB values
}


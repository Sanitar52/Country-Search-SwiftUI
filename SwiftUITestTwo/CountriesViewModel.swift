//
//  CountriesViewModel.swift
//  SwiftUITestTwo
//
//  Created by Finartz on 14.08.2024.
//

import Foundation
class CountriesViewModel: ObservableObject {
    @Published private var countries: [CountriesSearch] = []
    @Published public var filteredCountries: [CountriesSearch] = []
    @Published public var searchText = "" {
        didSet {
            filterCountries(searchText: searchText)
        }
    }
    public func getCountries() {
        Network.shared.request(url: "https://restcountries.com/v3.1/all") { result in
            switch result {
            case .success(let countriesResult):
                DispatchQueue.main.async {
                    self.countries = countriesResult
                    self.filteredCountries = countriesResult
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    public func filterCountries(searchText: String) {
        if searchText.isEmpty {
                filteredCountries = countries
            } else {
                filteredCountries = countries.filter { $0.name?.official?.contains(searchText) == true }
            }
    }
}

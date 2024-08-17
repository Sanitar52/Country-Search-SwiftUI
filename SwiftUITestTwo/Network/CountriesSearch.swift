import Foundation

struct CountriesSearch: Codable, Identifiable {
    let id: UUID = UUID() // Keep this as a unique identifier, but not part of Codable
    let name: Name?
    let capital: [String]?
    let population: Int?
    let flags: Flags?
    let latlng: [Double]?
}

struct Flags: Codable {
    let svg: String?
    let png: String?
}

struct Name: Codable {
    let common: String?
    let official: String?
}

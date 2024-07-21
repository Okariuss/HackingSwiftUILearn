//
//  FileManager-Decodable.swift
//  BucketList
//
//  Created by Okan Orkun on 21.07.2024.
//

import Foundation

extension FileManager {
    func decode<T: Codable>(_ file: String) -> T {
        let urls = self.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let documentsDirectory = urls.first else {
            fatalError("Failed to locate documents directory")
        }
        
        let fileURL = documentsDirectory.appendingPathComponent(file)
        
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Failed to load \(file) from documents directory")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from documents directory due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from documents directory due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from documents directory due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from documents directory because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from documents directory: \(error.localizedDescription)")
        }
    }
}

//
//  JSONEncoder+Extension.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation

// MARK: - JSONEncoder Extension
extension JSONEncoder {
    func encodeAsDictionary<T: Encodable>(_ encode: T) -> [String: Any]? {
        guard let data = try? self.encode(encode) else {
            return nil
        }
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return nil
        }
        
        return dictionary
    }
}

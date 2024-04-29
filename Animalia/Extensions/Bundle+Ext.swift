//
//  Bundle+Ext.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import Foundation

// Gunanya untuk decode data json sebagai bbundle (lokal data
// jadi dapat di reuse anytime anywhere all at once

extension Bundle {
    func decode<T: Codable> (_ file:String) -> T {
        // 1. Menentukan liokasi dari file json
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Kita set dan load data nya
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // 3. Buat decodernya
        let decoder = JSONDecoder()
        
        // 4. Simpan sebagai properti dari hasil data json yang sudah di decode
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return data yang sudah di decode dan ready-to-use
        return loaded
        
    }
    
    
    
}

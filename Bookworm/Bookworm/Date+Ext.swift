//
//  Date+Ext.swift
//  Bookworm
//
//  Created by Okan Orkun on 20.07.2024.
//

import Foundation

extension Date {
    func formattedCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}

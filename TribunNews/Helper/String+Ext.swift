//
//  String+Ext.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import Foundation

extension String {
    func formattedDateRelativeToCurrent() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        let now = Date()
        let componentsFormatter = DateComponentsFormatter()
        componentsFormatter.unitsStyle = .full
        componentsFormatter.maximumUnitCount = 1
        componentsFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        
        guard let relativeTimeString = componentsFormatter.string(from: date, to: now) else {
            return "Recently"
        }
        
        return "\(relativeTimeString) ago"
    }
}

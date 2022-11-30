//
//  String+Extension.swift
//  BeelineProject
//
//  Created by саргашкаева on 30.11.2022.
//

import Foundation

extension String {
    func getURL() -> URL? {
        URL(string: self)
    }
}

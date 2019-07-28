//
//  TimeInterval+ToString.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/20/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import Foundation

extension TimeInterval {

    func toString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: self) ?? ""
    }

}

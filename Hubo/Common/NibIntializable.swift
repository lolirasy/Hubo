//
//  NibIntializable.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/17/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import UIKit

protocol NibIntializable {

}

extension NibIntializable where Self : UIViewController {

    static func initialNib() -> UIViewController {
        let type = Mirror(reflecting: self).subjectType
        let nibName = String(describing: type).components(separatedBy: ".")[0]
        let controller = Self(nibName: nibName, bundle: nil)
        return controller
    }

}

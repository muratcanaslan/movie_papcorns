//
//  BaseView.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit
import Reusable

class BaseView: UIView, NibOwnerLoadable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
}

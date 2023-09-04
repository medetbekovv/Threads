//
//  FlexibleHeightWidth.swift
//  Threads
//
//  Created by Sultan on 2/8/23.
//

import UIKit

extension NSObject {
    func flexibleHeight(to: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * to / 852
    }
    func flexibleWidth(to: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * to / 393
    }
}

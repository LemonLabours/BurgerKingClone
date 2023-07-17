//
//  ViewHelpers.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 17/07/2023.
//

import Foundation
import SwiftUI

func adaptiveTextSize(size: CGFloat, max: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let scaledSize = screenWidth / 375.0 * size
    return min(scaledSize, max)
}

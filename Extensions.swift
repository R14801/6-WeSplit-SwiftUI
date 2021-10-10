//
//  Extensions.swift
//  WeSplit
//
//  Created by Rajat Nagvenker on 10/10/21.
//

import Foundation
import UIKit
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

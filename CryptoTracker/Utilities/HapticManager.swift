//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 23.04.2024.
//

import Foundation
import SwiftUI
class HapticManager{
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}

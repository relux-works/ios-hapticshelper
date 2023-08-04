// https://github.com/ivalx1s/hapticshelper-ios/
// MIT License
//
// Copyright (c) 2021 Ivan Oparin
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public enum SystemHapticEffect {
	case impact(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: Float)
	case selection
	case notification(UINotificationFeedbackGenerator.FeedbackType)
}

public protocol IHapticEffectService {
	func playHaptic(effect: SystemHapticEffect)
	func prepareHaptic(effect: SystemHapticEffect)
}

@available(iOS, introduced: 13.0)
public class HapticEffectService: IHapticEffectService, ObservableObject {
	private var  impactFeedbackGeneratorLightStyle:        UIImpactFeedbackGenerator =  .init(style: .light)
	private var impactFeedbackGeneratorMediumStyle:        UIImpactFeedbackGenerator =  .init(style: .medium)
	private var  impactFeedbackGeneratorHeavyStyle:        UIImpactFeedbackGenerator =  .init(style: .heavy)
	private var   impactFeedbackGeneratorSoftStyle:        UIImpactFeedbackGenerator =  .init(style: .soft)
	private var  impactFeedbackGeneratorRigidStyle:        UIImpactFeedbackGenerator =  .init(style: .rigid)
	private var         selectionFeedbackGenerator:     UISelectionFeedbackGenerator =  .init()
	private var      notificationFeedbackGenerator:  UINotificationFeedbackGenerator =  .init()
}


public extension HapticEffectService {
	
	func playHaptic(effect: SystemHapticEffect) {
		switch effect {
			case let .impact(style, intensity):
				self.doImpact(style: style, intensity: intensity)
			case let .notification(type):
				self.doNotificationImpact(for: type)
			case .selection:
				self.doSelectionImpact()
		}
	}
	
	func prepareHaptic(effect: SystemHapticEffect) {
		switch effect {
			case let .impact(style, _):
				self.prepareImpactGenerator(forStyle: style)
			case .notification:
				self.notificationFeedbackGenerator.prepare()
			case .selection:
				self.selectionFeedbackGenerator.prepare()
		}
	}
}


extension HapticEffectService {
	
	private func prepareImpactGenerator(forStyle style: UIImpactFeedbackGenerator.FeedbackStyle) {
		switch style {
			case .light:
				impactFeedbackGeneratorLightStyle.prepare()
			case .medium:
				impactFeedbackGeneratorMediumStyle.prepare()
			case .heavy:
				impactFeedbackGeneratorHeavyStyle.prepare()
			case .soft:
				impactFeedbackGeneratorSoftStyle.prepare()
			case .rigid:
				impactFeedbackGeneratorRigidStyle.prepare()
			@unknown default:
				break
		}
	}
	
	
	private func doImpact(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: Float) {
		
		switch style {
			case .light:
				impactFeedbackGeneratorLightStyle.impactOccurred(intensity: CGFloat(intensity))
			case .medium:
				impactFeedbackGeneratorMediumStyle.impactOccurred(intensity: CGFloat(intensity))
			case .heavy:
				impactFeedbackGeneratorHeavyStyle.impactOccurred(intensity: CGFloat(intensity))
			case .soft:
				impactFeedbackGeneratorSoftStyle.impactOccurred(intensity: CGFloat(intensity))
			case .rigid:
				impactFeedbackGeneratorRigidStyle.impactOccurred(intensity: CGFloat(intensity))
			@unknown default:
				break
		}
	}
	
	
	private func doSelectionImpact() {
		selectionFeedbackGenerator.selectionChanged()
	}
	
	
	private func doNotificationImpact(for feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
		notificationFeedbackGenerator.notificationOccurred(feedbackType)
	}
}


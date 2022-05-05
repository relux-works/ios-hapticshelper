import AVFoundation
import UIKit

protocol IHapticEffectService {

    func doImpact(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: Float)
    func doSelectionImpact()
    func doNotificationImpact(for feedbackType: UINotificationFeedbackGenerator.FeedbackType)
}

class HapticEffectService: IHapticEffectService {

    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    private var selectionFeedbackGenerator: UISelectionFeedbackGenerator = .init()
    private var notificationFeedbackGenerator: UINotificationFeedbackGenerator = .init()
    private var impactFeedbackGeneratorLastUsedStyle: UIImpactFeedbackGenerator.FeedbackStyle?

    init() {
        selectionFeedbackGenerator.prepare()
    }

    func doImpact(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: Float) {
        impactFeedbackGenerator = .init(style: style)
        impactFeedbackGenerator?.impactOccurred(intensity: CGFloat(intensity))
    }

    func doSelectionImpact() {
        selectionFeedbackGenerator.selectionChanged()
    }

    func doNotificationImpact(for feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        notificationFeedbackGenerator.notificationOccurred(feedbackType)
    }
}

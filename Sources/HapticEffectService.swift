import UIKit
import CoreHaptics

@MainActor
public protocol IHapticEffectService: Sendable {
    func doImpact(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: Float)
    func doSelectionImpact()
    func doNotificationImpact(for feedbackType: UINotificationFeedbackGenerator.FeedbackType)
}

@MainActor
public class HapticEffectService: IHapticEffectService, ObservableObject {
    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    private var selectionFeedbackGenerator: UISelectionFeedbackGenerator = .init()
    private var notificationFeedbackGenerator: UINotificationFeedbackGenerator = .init()
    private var impactFeedbackGeneratorLastUsedStyle: UIImpactFeedbackGenerator.FeedbackStyle?

    public init() {
        selectionFeedbackGenerator.prepare()
    }

    public func doImpact(style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: Float) {
        impactFeedbackGenerator = .init(style: style)
        impactFeedbackGenerator?.impactOccurred(intensity: CGFloat(intensity))
    }

    public func doSelectionImpact() {
        selectionFeedbackGenerator.selectionChanged()
    }

    public func doNotificationImpact(for feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        notificationFeedbackGenerator.notificationOccurred(feedbackType)
    }
}

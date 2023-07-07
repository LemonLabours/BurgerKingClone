import SwiftUI

enum FlameFont: String {
    case regular = "Flame"
    case bold = "Flame-Bold"
    case sans = "Flame Sans"
    case sansRegular = "FlameSans-Regular"
    case regularFont = "Flame-Regular"
}

extension View {
    func flame(font: FlameFont, size: CGFloat = 16) -> some View {
        self.modifier(AppFontModifier(font: font, size: size))
    }
}

struct AppFontModifier: ViewModifier {
    let font: FlameFont
    let size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}

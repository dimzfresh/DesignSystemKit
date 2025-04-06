import SwiftUI

public extension View {
    func dsFont(_ dsFont: DSFont) -> some View {
        font(dsFont.font)
    }
}

public enum DSFont {
    // MARK: Regular
    /// Title H0: Regular, 64pt
    case titleH0
    /// Title H1: Regular, 36pt
    case titleH1
    /// Title H2: Regular, 32pt
    case titleH2
    /// Title H3: Regular, 24pt
    case titleH3
    /// Title H4: Regular, 20pt
    case titleH4
    /// Body Medium Regular: Regular, 16pt
    case bodyMRegular
    /// Body Small Regular: Regular, 14pt
    case bodySRegular
    /// Body Extra Small Regular: Regular, 12pt
    case bodyXSRegular

    // MARK: Medium
    /// Body Medium Medium: Medium, 16pt
    case bodyMMedium
    /// Body Small Medium: Medium, 14pt
    case bodySMedium
    /// Body Extra Small Medium: Medium, 12pt
    case bodyXSMedium

    // MARK: - Bold
    /// Title H0 Strong: Bold, 64pt
    case titleH0Strong
    /// Title H1 Strong: Bold, 36pt
    case titleH1Strong
    /// Title H2 Strong: Bold, 32pt
    case titleH2Strong
    /// Title H3 Strong: Bold, 24pt
    case titleH3Strong
    /// Title H4 Strong: Bold, 20pt
    case titleH4Strong
    /// Body Medium Bold: Bold, 16pt
    case bodyMBold
    /// Body Small Bold: Bold, 14pt
    case bodySBold
    /// Body Extra Small Bold: Bold, 12pt
    case bodyXSBold

    public var font: Font {
        switch self {
        // MARK: Regular
        case .titleH0: .system(size: 64)
        case .titleH1: .system(size: 36)
        case .titleH2: .system(size: 32)
        case .titleH3: .system(size: 24)
        case .titleH4: .system(size: 20)
        case .bodyMRegular: .system(size: 16)
        case .bodySRegular: .system(size: 14)
        case .bodyXSRegular: .system(size: 12)
        // MARK: Medium
        case .bodyMMedium: .system(size: 16, weight: .medium)
        case .bodySMedium: .system(size: 14, weight: .medium)
        case .bodyXSMedium: .system(size: 12, weight: .medium)
        // MARK: - Bold
        case .titleH0Strong: .system(size: 64, weight: .bold)
        case .titleH1Strong: .system(size: 36, weight: .bold)
        case .titleH2Strong: .system(size: 32, weight: .bold)
        case .titleH3Strong: .system(size: 24, weight: .bold)
        case .titleH4Strong: .system(size: 20, weight: .bold)
        case .bodyMBold: .system(size: 16, weight: .bold)
        case .bodySBold: .system(size: 14, weight: .bold)
        case .bodyXSBold: .system(size: 12, weight: .bold)
        }
    }

    public static func registerFonts() {
        registerFont(AppFont.bold.rawValue, fontExtension: "ttf")
        registerFont(AppFont.demiBold.rawValue, fontExtension: "ttf")
        registerFont(AppFont.extraLight.rawValue, fontExtension: "ttf")
        registerFont(AppFont.light.rawValue, fontExtension: "ttf")
        registerFont(AppFont.medium.rawValue, fontExtension: "ttf")
        registerFont(AppFont.regular.rawValue, fontExtension: "ttf")
    }

    private static func registerFont(_ name: String, fontExtension: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: fontExtension) else {
            fatalError("Font \(name).\(fontExtension) wasn't found in the module bundle")
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
    }
}

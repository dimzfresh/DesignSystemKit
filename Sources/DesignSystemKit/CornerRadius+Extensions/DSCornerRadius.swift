import Foundation

public enum DSCornerRadius: CGFloat {
    /// Extra extra small corner radius (2 points)
    case xxs = 2
    /// Extra small corner radius (4 points)
    case xs = 4
    /// Small corner radius (8 points)
    case s = 8
    /// Medium corner radius (12 points)
    case m = 12
    /// Large corner radius (16 points)
    case l = 16
    /// Extra large corner radius (20 points)
    case xl = 20
    /// Extra extra large corner radius (24 points)
    case xxl = 24
    /// Triple extra large corner radius (32 points)
    case xxxl = 32
    /// Fully rounded corner (1000 points, effectively circular for most shapes)
    case round = 1000
}

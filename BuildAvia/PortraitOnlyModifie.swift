import SwiftUI
import UIKit

struct PortraitOnlyModifier: ViewModifier {
    @State private var orientation = UIDevice.current.orientation

    func body(content: Content) -> some View {
        content
            .onAppear {
                
                UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            }
            .onDisappear {
                UIDevice.current.endGeneratingDeviceOrientationNotifications()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
            
            .rotationEffect(angleForOrientation(orientation))
    }
    
    private func angleForOrientation(_ orientation: UIDeviceOrientation) -> Angle {
        
        switch orientation {
        case .landscapeLeft:
            return Angle(degrees: -90)
        case .landscapeRight:
            return Angle(degrees: 90)
        default:
            return Angle(degrees: 0)
        }
    }
}

extension View {
    func portraitOnlyRotation() -> some View {
        self.modifier(PortraitOnlyModifier())
    }
}

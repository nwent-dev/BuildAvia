import Foundation

class GameManager: ObservableObject {
    static let shared = GameManager()
    private init() {}
    
    @Published var bgIndex: Int = 1
    @Published var planeIndex: Int = 1
    @Published var isSoundOff: Bool = true
    
    func scrollPlane(side: Side) {
        if side == .left {
            if planeIndex < 5 {
                planeIndex += 1
                if planeIndex == 5 {
                    planeIndex = 1
                }
            }
        } else {
            if planeIndex > 1 {
                planeIndex -= 1
            } else {
                planeIndex = 4
            }
        }
    }
    
    func changeBg() {
        if bgIndex < 4 {
            bgIndex += 1
            if bgIndex == 4 {
                bgIndex = 1
            }
        }
    }
}

enum Side {
    case left, right
}

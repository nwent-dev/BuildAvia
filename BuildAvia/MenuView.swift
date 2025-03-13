import SwiftUI

struct MenuView: View {
    @State private var width = UIScreen.main.bounds.width
    @State private var height = UIScreen.main.bounds.height
    
    @State private var bgIndex: Int = 1
    @State private var planeIndex: Int = 1
    @ObservedObject var gameManager = GameManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg\(gameManager.bgIndex)\(gameManager.bgIndex)")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack {
                    VStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                gameManager.scrollPlane(side: .left)
                            }
                        } label: {
                            Image("leftBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.15)
                        }
                        
                        Spacer()
                        NavigationLink {
                            withAnimation {
                                SoundView()
                            }
                        } label: {
                            Image("soundBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.3)
                                .padding(.bottom)
                                .shadow(
                                    color: .black.opacity(0.8),
                                    radius: 10,
                                    y: height * 0.1
                                )
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            withAnimation {
                                gameManager.changeBg()
                            }
                        } label: {
                            Image("bgBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.2)
                                .padding(.trailing, width * 0.15)
                        }
                        
                        Spacer()
                        
                        Image("plane\(gameManager.planeIndex)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.4)
                            .shadow(
                                color: .black.opacity(0.8),
                                radius: 10,
                                y: height * 0.1
                            )
                        
                        NavigationLink {
                            withAnimation {
                                GameView()
                            }
                        } label: {
                            Image("playBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.1)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                gameManager.scrollPlane(side: .right)
                            }
                        } label: {
                            Image("rightBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.15)
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            withAnimation{
                                TimeView()
                            }
                        } label: {
                            Image("timeBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.3)
                                .padding(.bottom)
                                .shadow(
                                    color: .black.opacity(0.8),
                                    radius: 10,
                                    y: height * 0.1
                                )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}

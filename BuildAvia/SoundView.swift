import SwiftUI

struct SoundView: View {
    @Environment(\.dismiss) var dismiss
    @State private var width = UIScreen.main.bounds.width
    @State private var height = UIScreen.main.bounds.height
    
    @State private var isSoundOff: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("soundBg")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack{
                    Spacer()
                    
                    ZStack {
                        Image(isSoundOff ? "soundViewOff" : "soundViewOn")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.9)
                        
                        Button {
                            dismiss()
                        } label: {
                            Image("closeBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.13)
                                .padding(.leading, width * 0.25)
                                .padding(.bottom, height * 0.7)
                        }
                        
                        Button {
                            isSoundOff.toggle()
                            if !isSoundOff {
                                AudioManager.shared.play()
                            } else {
                                AudioManager.shared.pause()
                            }
                        } label: {
                            Image(isSoundOff ? "offBtn" : "onBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.15)
                                .padding(.leading, width * 0.13)
                                .padding(.top, height * 0.26)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SoundView()
}

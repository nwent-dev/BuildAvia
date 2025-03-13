import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @State private var width = UIScreen.main.bounds.width
    @State private var height = UIScreen.main.bounds.height
    @State private var plane: Plane = Plane(body: 0, wings: 0, engines: 0, chassis: 0)
    @State private var timerValue = 60
    @State private var timer: Timer?
    
    var formattedTime: String {
        let minutes = timerValue / 60
        let seconds = timerValue % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        NavigationView{
            ZStack {
                Image("bg\(GameManager.shared.bgIndex)\(GameManager.shared.bgIndex)")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack(spacing:0) {
                    VStack(spacing: 0) {
                        enclosures
                        wings
                    }
                    
                    VStack {
                        // Таймер
                        ZStack {
                            Image("timeView2")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.15)
                                .padding(.top)
                            Text("\(formattedTime)")
                                .font(.system(size: height * 0.07, weight: .light))
                                .foregroundColor(timerValue > 10 ? .white : .red)
                                .padding(.top)
                        }
                        .onTapGesture {
                            dismiss()
                        }

                        Spacer()
                        
                        if plane.body == plane.chassis &&
                            plane.chassis == plane.engines &&
                            plane.engines == plane.wings && plane.chassis != 0 {
                            Image("fullPlane\(plane.body)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.5)
                        } else {
                            Image("fullPlane")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.5)
                        }

                        ZStack {
                            Rectangle()
                                .fill(Color.black.opacity(0.8))
                                .border(Color.red, width: 1)
                                .frame(width: width * 0.5, height: height * 0.111627907)
                            if plane.body == plane.chassis &&
                                plane.chassis == plane.engines &&
                                plane.engines == plane.wings && plane.chassis != 0 {
                                Text("COMPLETE")
                                    .foregroundStyle(.green)
                                    .shadow(color: .green, radius: 10)
                            }
                        }
                        .padding(.bottom, height * 0.029)
                    }
                    
                    VStack(spacing: 0) {
                        turbines
                        chassis
                    }
                }
            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timerValue > 0 {
                timerValue -= 1
            } else {
                stopTimer()
                dismiss()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    var enclosures: some View {
        VStack(spacing: 0){
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .border(Color.red, width: 1)
                    .frame(width: width * 0.2060085837, height: height * 0.111627907)
                Text("ENCLOSURES")
                    .foregroundStyle(.white)
            }
            ForEach(0..<3, id: \.self) { index in
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.8))
                            .border(Color.red, width: 1)
                            .frame(width: width * 0.2060085837, height: height * 0.111627907)
                        
                        Image("body\(index + 1)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.08)
                            .shadow(color: Color.red, radius: plane.body == index + 1 ? 10 : 0)
                    }
                    .onTapGesture {
                        plane.body = index + 1
                    }
                }
            }
        }
    }
    var wings: some View {
        VStack(spacing: 0) {
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .border(Color.red, width: 1)
                    .frame(width: width * 0.2060085837, height: height * 0.111627907)
                Text("WINGS")
                    .foregroundStyle(.white)
            }
            ForEach(0..<3, id: \.self) { index in
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.8))
                            .border(Color.red, width: 1)
                            .frame(width: width * 0.2060085837, height: height * 0.111627907)
                        
                        Image("wings\(index + 1)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.06)
                            .shadow(
                                color: Color.red,
                                radius: plane.wings == index + 1 ? 10 : 0
                            )
                            .onTapGesture {
                                plane.wings = index + 1
                            }
                    }
                }
            }
        }
    }
    var turbines: some View {
        VStack(spacing: 0) {
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .border(Color.red, width: 1)
                    .frame(width: width * 0.2060085837, height: height * 0.111627907)
                Text("TURBINE")
                    .foregroundStyle(.white)
            }
            ForEach(0..<3, id: \.self) { index in
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.8))
                            .border(Color.red, width: 1)
                            .frame(width: width * 0.2060085837, height: height * 0.111627907)
                        
                        Image("engines\(index + 1)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.06)
                            .shadow(
                                color: Color.red,
                                radius: plane.engines == index + 1 ? 10 : 0
                            )
                            .onTapGesture {
                                plane.engines = index + 1
                            }
                    }
                }
            }
        }
    }
    var chassis: some View {
        VStack(spacing: 0) {
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .border(Color.red, width: 1)
                    .frame(width: width * 0.2060085837, height: height * 0.111627907)
                Text("CHASSIS")
                    .foregroundStyle(.white)
            }
            ForEach(0..<3, id: \.self) { index in
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.8))
                            .border(Color.red, width: 1)
                            .frame(width: width * 0.2060085837, height: height * 0.111627907)
                        
                        Image("chassis\(index + 1)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.06)
                            .shadow(
                                color: Color.red,
                                radius: plane.chassis == index + 1 ? 10 : 0
                            )
                            .onTapGesture {
                                plane.chassis = index + 1
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    GameView()
}

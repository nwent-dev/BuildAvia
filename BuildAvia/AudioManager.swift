import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager() // Singleton instance

    private var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var volume: Float = 0.5 {
        didSet {
            audioPlayer?.volume = volume
        }
    }

    private init() {
        setupAudio()
    }

    private func setupAudio() {
        guard let url = Bundle.main.url(forResource: "background_music", withExtension: "mp3") else {
            print("Music file not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.volume = volume
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }

    func play() {
        audioPlayer?.play()
        isPlaying = true
    }

    func pause() {
        audioPlayer?.pause()
        isPlaying = false
    }

    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
}

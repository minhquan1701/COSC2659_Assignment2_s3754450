//
//  PlaySound.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 26/08/2022.
// ref :Tom Huynh
import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, isRepeat: Bool = false) {

    if let path = Bundle.main.path(forResource:sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = isRepeat ? -1 : 0
            audioPlayer?.play()
        } catch {
            print("ERROR: Cannot play the sound file")
        }
    }

}

func stopSound(){
    audioPlayer?.stop()
}


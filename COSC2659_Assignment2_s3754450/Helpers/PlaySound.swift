//
//  PlaySound.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 26/08/2022.
/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Hoang Minh Quan
  ID: s3754450
  Created  date: 20/8/2022
  Last modified: 27/8/2022
  Acknowledgement: The code for playing sound is taken inspiration from Mr. Tom Huynh, Lecturer of IOS Development course in RMIT university.
*/

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, isRepeat: Bool = false) {

    if let path = Bundle.main.path(forResource:sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = isRepeat ? -1 : 0 // -1 for repeating infinitely
            audioPlayer?.play()
        } catch {
            print("ERROR: Cannot play the sound file")
        }
    }

}

func stopSound(){
    audioPlayer?.stop()
}


//
//  SixthViewController.swift
//  Project
//
//  Created by DUC PHAM on 12/05/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//reference for code to make music player part 2: https://www.youtube.com/watch?v=3B7uaK_0OJk

import UIKit
import AVFoundation

class SixthViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
   //Button to play music
    @IBAction func play(_ sender: Any)
    {
        
        if audio == true && audioPlayer.isPlaying == false
        {
        
            audioPlayer.play()
        }
    }
    
    //Button to pause music
    @IBAction func pause(_ sender: Any)
    {
        if audio == true && audioPlayer.isPlaying
        {
            
                audioPlayer.pause()
            
        }
    }
    
    
    @IBAction func prev(_ sender: Any)
    {
        if thisSong != 0 && audio == true
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
             label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    
    @IBAction func next(_ sender: Any)
    {
        if thisSong < songs.count-1 && audio == true
        {
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
             label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    
    @IBAction func slider(_ sender: UISlider)
    {
       if audio == true
       {
         audioPlayer.volume = sender.value
        }
        

    }
    
    func playThis(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
        }
        catch
        {
            print ("Error");
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs[thisSong]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

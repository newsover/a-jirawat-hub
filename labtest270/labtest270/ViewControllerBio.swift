//
//  ViewControllerBio.swift
//  labtest270
//
//  Created by Student on 7/11/2561 BE.
//  Copyright © 2561 Student. All rights reserved.
//

import UIKit
import AVKit

class ViewControllerBio: UIViewController {
    @IBOutlet weak var imgBio: UIImageView!
    @IBOutlet weak var txtBio: UITextView!
    @IBAction func vidPlay(_ sender: Any) {
        let _:UIButton = sender as!UIButton
        let path = Bundle.main.path(forResource: "vid", ofType: "mp4")!
        let vidUrl = URL(fileURLWithPath: path)
        let play = AVPlayer(url: vidUrl)
        let playerView = AVPlayerViewController()
        playerView.player = play
        self.present(playerView, animated: true){
            playerView.player!.play()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

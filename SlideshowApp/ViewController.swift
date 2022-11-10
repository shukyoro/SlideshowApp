//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 廣田秀人 on 2022/11/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    
    // 画像の名前を格納する配列
    let gazou = ["gazou1.jpg", "gazou2.jpg", "gazou3.jpg", "gazou4.jpg", "gazou5.jpg", "gazou6.jpg"]
    // 配列のインデックスを指定する変数
    var gazouNumber = 0
    // タイマー
    var timer: Timer!
    // タイマー再生/停止を判別する変数
    var timerEnable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 最初の画像を表示
        imageView.image = UIImage(named: gazou[gazouNumber])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // スライドショー時はタイマーを停止
        if timerEnable {
            self.timer.invalidate()
        }
        self.timerEnable = false
        
        playButton.isEnabled = true
        backButton.isEnabled = true
        playStopButton.setTitle("再生", for: .normal)
        
        // segueから遷移先のEnlargeViewControllerを取得する
        let enlargeViewController:EnlargeViewController = segue.destination as! EnlargeViewController
        // 遷移先のEnlargeViewControllerで宣言している gazouName に値を代入して渡す
        enlargeViewController.gazouName = gazou[gazouNumber]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // 2秒毎に次の画像に変える
    @objc func updateTimer(_ timer: Timer) {
        if gazouNumber == 5 {
            gazouNumber = 0
        } else {
            gazouNumber += 1
        }
        imageView.image = UIImage(named: gazou[gazouNumber])
    }

    // 一つ後の画像へ
    @IBAction func forwardImage(_ sender: Any) {
        if gazouNumber == 5 {
            gazouNumber = 0
        } else {
            gazouNumber += 1
        }
        imageView.image = UIImage(named: gazou[gazouNumber])
    }
    
    // 一つ前の画像へ
    @IBAction func backImage(_ sender: Any) {
        if gazouNumber == 0 {
            gazouNumber = 5
        } else {
            gazouNumber -= 1
        }
        imageView.image = UIImage(named: gazou[gazouNumber])
    }
    
    // スライドショー再生、停止
    @IBAction func playStopImage(_ sender: Any) {
        // スライドショー再生していないとき
        if timerEnable == false {
            // タイマー状態を有効に
            self.timerEnable = true
            // タイマースタート
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            // 再生時ボタン無効
            playButton.isEnabled = false
            backButton.isEnabled = false
            // ボタンのラベルを　停止　へ変更
            playStopButton.setTitle("停止", for: .normal)
        } else {
            // タイマー状態を無効に
            self.timerEnable = false
            // タイマー停止
            self.timer.invalidate()
            
            // 停止時ボタン有効
            playButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンのラベルを　再生　へ変更
            playStopButton.setTitle("再生", for: .normal)
        }
    }
}


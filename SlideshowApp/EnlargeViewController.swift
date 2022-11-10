//
//  EnlargeViewController.swift
//  SlideshowApp
//
//  Created by 廣田秀人 on 2022/11/09.
//

import UIKit

class EnlargeViewController: UIViewController {
    @IBOutlet weak var enlargeImageView: UIImageView!
    // 画像の名前を保存する変数
    var gazouName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // ImageViewに画像を表示
        enlargeImageView.image = UIImage(named: gazouName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

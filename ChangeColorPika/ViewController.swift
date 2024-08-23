//
//  ViewController.swift
//  ChangeColorPika
//
//  Created by kate on 2024/8/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pikaImageView: UIImageView!
    @IBOutlet weak var backgroudImageView: UIImageView!
    @IBOutlet weak var skinView: UIView!
    @IBOutlet weak var clothingView: UIView!
    @IBOutlet weak var seamView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // 保存不同部分的滑塊值
    var skinSliderValue : [Float] = [0.5,0.5,0.5,0]
    var clothingSliderValue : [Float] = [0.5,0.5,0.5,0]
    var seamSliderValue : [Float] = [0.5,0.5,0.5,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 創建一個 UIImageView 來顯示皮卡丘的衣服
        let clothingImageView = UIImageView(image: UIImage(named: "clothing"))
        clothingImageView.frame = clothingView.bounds
        clothingImageView.contentMode = .scaleAspectFit
        clothingView.mask = clothingImageView
        clothingView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0)
        
        let skinImageView = UIImageView(image: UIImage(named: "skin"))
        skinImageView.frame = skinView.bounds
        skinImageView.contentMode = .scaleAspectFit
        skinView.mask = skinImageView
        skinView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0)
        
        let seamImageView = UIImageView(image: UIImage(named: "seam"))
        seamImageView.frame = seamView.bounds
        seamImageView.contentMode = .scaleAspectFit
        seamView.mask = seamImageView
        seamView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0)
        
        // 設置 backgroud 的圆角和邊框和透明度
        backgroudImageView.layer.cornerRadius = 20
        backgroudImageView.clipsToBounds = true
        backgroudImageView.layer.borderWidth = 0
        backgroudImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
    }

    //
    @IBAction func changeSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            redSlider.value = skinSliderValue[0]
            greenSlider.value = skinSliderValue[1]
            blueSlider.value = skinSliderValue[2]
            alphaSlider.value = skinSliderValue[3]
        case 1:
            redSlider.value = clothingSliderValue[0]
            greenSlider.value = clothingSliderValue[1]
            blueSlider.value = clothingSliderValue[2]
            alphaSlider.value = clothingSliderValue[3]
        case 2:
            redSlider.value = seamSliderValue[0]
            greenSlider.value = seamSliderValue[1]
            blueSlider.value = seamSliderValue[2]
            alphaSlider.value = seamSliderValue[3]
        default:
            return
        }
    }
    
    @IBAction func changeColor(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            skinView.backgroundColor = UIColor(red:CGFloat( redSlider.value), green: CGFloat( greenSlider.value), blue: CGFloat( blueSlider.value), alpha: CGFloat( alphaSlider.value))
        case 1:
            clothingView.backgroundColor = UIColor(red:CGFloat( redSlider.value), green: CGFloat( greenSlider.value), blue: CGFloat( blueSlider.value), alpha: CGFloat( alphaSlider.value))
        case 2:
            seamView.backgroundColor = UIColor(red:CGFloat( redSlider.value), green: CGFloat( greenSlider.value), blue: CGFloat( blueSlider.value), alpha: CGFloat( alphaSlider.value))
        default:
            return
        }
        saveColor()
    }
    
    func saveColor(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            skinSliderValue = [redSlider.value, greenSlider.value, blueSlider.value, alphaSlider.value]
        case 1:
            clothingSliderValue = [redSlider.value, greenSlider.value, blueSlider.value, alphaSlider.value]
        case 2:
            seamSliderValue = [redSlider.value, greenSlider.value, blueSlider.value, alphaSlider.value]
        default:
            return
        }
    }
    
    @IBAction func resetColor(_ sender: Any) {
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        alphaSlider.value = 0
        changeColor(sender)
    }
    
}


//#Preview {
//    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
//}


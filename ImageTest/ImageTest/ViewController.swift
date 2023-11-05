//
//  ViewController.swift
//  ImageTest
//
//  Created by mhhy5 on 2023/9/12.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    var image = UIImage(named: "1024")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let categorys = [kCICategoryDistortionEffect,kCICategoryGeometryAdjustment,kCICategoryCompositeOperation,kCICategoryHalftoneEffect,kCICategoryColorAdjustment,kCICategoryColorEffect,kCICategoryTransition,kCICategoryTileEffect,kCICategoryGenerator,kCICategoryReduction,kCICategoryGradient,kCICategoryStylize,kCICategorySharpen,kCICategoryBlur,kCICategoryVideo,kCICategoryStillImage,kCICategoryInterlaced,kCICategoryNonSquarePixels,kCICategoryHighDynamicRange,kCICategoryBuiltIn,kCICategoryFilterGenerator]
        
        for category in categorys {
            print("------------- \(category) begin -------------")
            let names = CIFilter.filterNames(inCategory: category)
            for name in names {
                print(name)
            }
            print("------------- \(category) end -------------\n")
        }
        
    }

    @IBAction func action(_ sender: Any) {
        guard let image = image, let filterName = textField.text else { return }
        let ciImage = CIImage(image: image)
        let filter = CIFilter(name: filterName)
        filter?.setDefaults()
        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        guard let outputImage = filter?.outputImage else { return }
        let uiImage = UIImage(ciImage: outputImage)
        imageView.image = uiImage
    }
    
}


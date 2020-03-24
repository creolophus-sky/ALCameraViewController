//
//  UIImageExtensions.swift
//  ALCameraViewController
//
//  Created by Vadym Patalakh on 24.03.2020.
//  Copyright © 2020 zero. All rights reserved.
//

import UIKit

extension UIImage {
    public func desaturatedImage() -> UIImage? {
        guard let image = self.cgImage else { return nil }
        let currentCIImage = CIImage(cgImage: image)

        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")

        // set a gray value for the tint color
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")

        filter?.setValue(1.0, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else { return nil }

        let context = CIContext()

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            return processedImage
        }

        return nil
    }
}

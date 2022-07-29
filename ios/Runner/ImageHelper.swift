//
//  ImageHelper.swift
//  Runner
//
//  Created by Su Vu Van on 27/07/2022.
//
import Photos

class ImageHelper: NSObject {
    
    // singleton manager
    class var shared: ImageHelper {
        struct Singleton {
            static let instance = ImageHelper()
        }
        return Singleton.instance
    }

    func getImageLocalIdentifier(with path: String) -> String {
        return path
    }
    
    func getImageFrom(path: String) -> UIImage? {
        return UIImage(contentsOfFile: path)
    }

}

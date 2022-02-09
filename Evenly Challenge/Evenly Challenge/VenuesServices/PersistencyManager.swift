//
//  PersistencyManager.swift
//  Evenly Challenge
//
//  Created by Rasul Mammadov on 09.02.22.
//

import Foundation
import UIKit


extension Notification.Name {
    public static let downloadImageNotification = Notification.Name("DownloadImageNotification")
}

final class PersistencyManager {
    public static let shared = PersistencyManager()
    private var documents: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private init() {
        
    }
    
    @objc func downloadTransactionData(with notification: Notification) {
        guard let userInfo = notification.userInfo,
            let imageView = userInfo["EvenlyImageView"] as? UIImageView,
            let imageUrl = userInfo["iconUrl"] as? String,
            let filename = URL(string: imageUrl)?.lastPathComponent else {
                return
        }
        if let savedImage = getImage(with: filename) {
            imageView.image = savedImage
            return
        }
        DispatchQueue.global().async { [weak self] () -> Void in
            guard let this = self else { return }
            let downloadedImage = this.downloadImage(imageUrl) ?? UIImage()
            DispatchQueue.main.async {
                imageView.image = downloadedImage
                this.saveImage(downloadedImage, filename: filename)
            }
        }
    }
    
    private var cache: URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
  
    func downloadImage(_ url: String) -> UIImage? {
        guard let aUrl = URL(string: url),
            let data = try? Data(contentsOf: aUrl),
            let image = UIImage(data: data) else {
                return nil
        }
        return image
    }
    
    func saveImage(_ image: UIImage, filename: String) {
        let url = cache.appendingPathComponent(filename)
        guard let data = image.pngData() else {
          return
        }
        try? data.write(to: url)
    }

    func getImage(with filename: String) -> UIImage? {
        let url = cache.appendingPathComponent(filename)
        guard let data = try? Data(contentsOf: url) else {
          return nil
        }
        return UIImage(data: data)
    }
}

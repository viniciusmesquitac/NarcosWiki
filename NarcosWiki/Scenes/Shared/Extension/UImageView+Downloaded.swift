//
//  UImageView+Downloaded.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 10/06/21.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill, completion: @escaping () -> Void) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                UIView.animate(withDuration: 0.3, animations: {
                    self?.alpha = 1
                }, completion: { finished in
                    print("animation finished")
                })
                completion()
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill, completion: @escaping () -> Void) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, completion: completion)
    }
}

extension UIImageView {

    func rounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

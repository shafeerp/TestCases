//
//  Extensions+UIImageView.swift
//  Test Cases
//
//  Created by Shafeer P on 24/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(_ urlString: String) {
        image =  UIImage(named: "placeholder")
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let selfObject = self,let data = data, error == nil else { return }
            DispatchQueue.main.async {
                selfObject.image = UIImage(data: data)
            }
        }.resume()
    }
}

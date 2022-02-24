//
//  ViewController.swift
//  CompletionBlock-Tutorial
//
//  Created by Kwon Young Jeong on 2022/02/24.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

	@IBOutlet weak var mainTitle: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		print("ViewController - viewDidLoad() called")
		
		KRProgressHUD.show()
		
		sayHi(completion: { result in
			print("컴플레션 블럭으로 넘겨 받았음: \(result)")
			KRProgressHUD.showSuccess()
			
			self.mainTitle.text = result
		})
	}

	
	fileprivate func sayHi(completion: @escaping(String) -> ()){
		
		print("ViewController - sayHi() called")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
			// Code you want to be delayed
			//print("Hi!")
			completion("Hi")
		}
	}
	
}


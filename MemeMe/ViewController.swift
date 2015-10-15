//
//  ViewController.swift
//  MemeMe
//
//  Created by Will Wyatt on 9/26/15.
//  Copyright (c) 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    // Storyboard Outlets
    @IBOutlet weak var topTF: UITextField!
    @IBOutlet weak var bottomTF: UITextField!
    @IBOutlet weak var memeImage: UIImageView!
    
    // Constant vars
    let memedTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSStrokeWidthAttributeName : 5,
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        topTF.delegate = self
        bottomTF.delegate = self
        
        topTF.text = "TOP"
        bottomTF.text = "BOTTOM"
        
        topTF.textAlignment = .Center
        bottomTF.textAlignment = NSTextAlignment.Center
        
        topTF.defaultTextAttributes = memedTextAttributes
        bottomTF.defaultTextAttributes = memedTextAttributes
    }

    // Button Actions
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pickImageAlbum(sender: UIBarButtonItem) {
        // Create image picker controller and delagate to this view controller
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // Pick source type
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // Present view
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // Delegate functions
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // load selected image into UIImageView
        var pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        if pickedImage == nil {
            pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        // Scale and assign image
        memeImage.contentMode = .ScaleAspectFit
        memeImage.image = pickedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}


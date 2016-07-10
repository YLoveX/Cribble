//
//    Copyright (c) 2016 Max Sokolov https://twitter.com/max_sokolov
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

class CribbleOptionsController: UIViewController {

    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorValueLabel: UILabel!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var opacityValueLabel: UILabel!
    @IBOutlet weak var separatorView1: UIView!
    @IBOutlet weak var separatorView2: UIView!
    @IBOutlet weak var separatorView1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView2HeightConstraint: NSLayoutConstraint!
    
    var colors = CribbleOptions.colors()
    var colorIndex = 0
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        separatorView1HeightConstraint.constant = 1 / UIScreen.mainScreen().scale
        separatorView2HeightConstraint.constant = 1 / UIScreen.mainScreen().scale
        
        optionsView.layer.masksToBounds = false
        optionsView.layer.shadowRadius = 5
        optionsView.layer.shadowOpacity = 0.1
        optionsView.layer.shadowOffset = CGSizeMake(0, 10)
        
        closeButton.layer.masksToBounds = false
        closeButton.layer.shadowRadius = 5
        closeButton.layer.shadowOpacity = 0.1
        closeButton.layer.shadowOffset = CGSizeMake(0, 10)
        
        setupColors(UIColor.orangeColor())
    }
    
    func setupColors(color: UIColor) {

        view.backgroundColor = color
        separatorView1.backgroundColor = color
        separatorView2.backgroundColor = color
        sizeLabel.textColor = color
        sizeTextField.textColor = color
        colorLabel.textColor = color
        colorValueLabel.textColor = color
        opacityLabel.textColor = color
        opacityValueLabel.textColor = color
        opacitySlider.minimumTrackTintColor = color
        opacitySlider.maximumTrackTintColor = color
    }
    
    @IBAction func colorButtonClicked(sender: UIButton) {

        colorIndex += 1
        if colorIndex == colors.count {
            colorIndex = 0
        }
        
        UIView.animateWithDuration(0.4) {
            self.setupColors(self.colors[self.colorIndex])
        }
    }
    
    @IBAction func closeButtonClicked(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func opacityValueChanged(sender: UISlider) {
    
    }
}
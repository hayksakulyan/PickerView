//
//  ViewController.swift
//  Project_5_PickerView
//
//  Created by Hayk Sakulyan on 24.02.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiPickerView: UIPickerView!
    @IBOutlet weak var lblone: UILabel!
    @IBOutlet weak var lblTwo: UILabel!
    
    var modelData = ProductViewModel()
    var selectedMark: Mark?
    var selectedModel: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        modelData.setupData()
        configPickerView()
        
    }

    
    
    func configPickerView() {
        uiPickerView.delegate = self
        uiPickerView.dataSource = self
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return modelData.marks.count
        case 1:
            return modelData.modelsByMark.count
            
        default:
            return 0;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let mark = modelData.marks[row]
            return mark.name
        } else {
            let model = modelData.modelsByMark[row]
            return model.name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let mark = modelData.marks[row]
            selectedMark = mark

            modelData.modelsByMark = modelData.getModel(mark_id: mark.id)
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            let model = self.modelData.modelsByMark[0]
            selectedModel = model
            
            if let mark = selectedMark, let model = selectedModel {
                lblone.text = "\(mark.name) \(model.name)"
            }
        } else {
            let mark = modelData.modelsByMark[row]
            selectedModel = mark
            if let mark = selectedMark, let model = selectedModel {
                lblTwo.text = "\(mark.name) \(model.name)"
            }
        }
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//
//    }
    
    
}


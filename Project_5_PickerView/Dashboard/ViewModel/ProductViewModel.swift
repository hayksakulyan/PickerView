//
//  ProductViewModel.swift
//  Project_5_PickerView
//
//  Created by Hayk Sakulyan on 24.02.23.
//

import Foundation

class ProductViewModel {
    
    var marks = [Mark]()
    var models = [Model]()
    var modelsByMark = [Model]()
    
    func setupData() {
        
        let mark1 = Mark(id: 1, name: "BMW")
        let mark2 = Mark(id: 2, name: "Toyota")
        let mark3 = Mark(id: 3, name: "Honda")
        let mark4 = Mark(id: 4, name: "Opel")
        
        marks = [mark1, mark2, mark3, mark4]
        
        let model1 = Model(id: 1, name: "M3", mark_id: 1)
        let model2 = Model(id: 2, name: "M4", mark_id: 1)
        let model3 = Model(id: 3, name: "M5", mark_id: 1)
        let model4 = Model(id: 4, name: "M6", mark_id: 1)
        
        let model5 = Model(id: 1, name: "Corolla", mark_id: 2)
        let model6 = Model(id: 2, name: "Camry", mark_id: 2)
        let model7 = Model(id: 3, name: "Prado", mark_id: 2)
        let model8 = Model(id: 4, name: "Rav4", mark_id: 2)
        
        let model9 = Model(id: 1, name: "Civic", mark_id: 3)
        let model10 = Model(id: 2, name: "Pilot", mark_id: 3)
        let model11 = Model(id: 3, name: "Accord", mark_id: 3)
        let model12 = Model(id: 4, name: "City", mark_id: 3)
        
        let model13 = Model(id: 1, name: "Corsa", mark_id: 4)
        let model14 = Model(id: 2, name: "Vectra", mark_id: 4)
        let model15 = Model(id: 3, name: "Insignia", mark_id: 4)
        let model16 = Model(id: 4, name: "Tigra", mark_id: 4)
     
        models = [model1, model2, model3, model4, model5, model6, model7, model8, model9, model10, model11, model12, model13, model14, model15, model16]
        
        self.modelsByMark = getModel(mark_id: marks.first!.id)
    }
    func getModel(mark_id: Int) -> [Model] {
        let models = self.models.filter({ model in
            model.mark_id == mark_id
        })
        return models
    }
}

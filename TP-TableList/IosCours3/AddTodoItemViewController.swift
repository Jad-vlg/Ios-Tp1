import UIKit

class AddTodoItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerColor.delegate = self
        pickerColor.dataSource = self
    }
    
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var pickerColor: UIPickerView!
    
    var currColor:UIColor?
    
    var todoItem:ToDoItem?
    
    let colorsItem = [UIColor.white, UIColor.green, UIColor.blue, UIColor.gray, UIColor.red]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIBarButtonItem, sender == doneButton {
            if let text = textField.text, text.count > 0 {
                todoItem = ToDoItem(itemName: text, color:currColor ?? UIColor.white)
            } }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorsItem.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0
        {
            currColor = colorsItem[0]
            return "White"
        }
        
        if row == 1
        {
            currColor = colorsItem[1]
            return "Green"
        }
        
        if row == 2
        {
            currColor = colorsItem[2]
            return "Blue"
        }
        
        if row == 3
        {
            currColor = colorsItem[3]
            return "Gray"
        }
        
        currColor = colorsItem[4]
        return "Red"
    }
    
}

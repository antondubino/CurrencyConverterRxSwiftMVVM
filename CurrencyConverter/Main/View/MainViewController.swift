//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 27.09.2022.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController{

    var viewModel: MainViewControllerViewModelType? = MainViewModel()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currnecyLabel2: UILabel!
    @IBOutlet weak var currencyLabel1: UILabel!
    @IBOutlet weak var currencyImage1: UIImageView!
    @IBOutlet weak var currencyImage2: UIImageView!
    @IBOutlet weak var cButton: UIButton!
    
    let db = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel1Tap()
        setupLabel2Tap()
        getDate()
        setupImageView(currencyImage1)
        setupImageView(currencyImage2)
        findLabel2(label1)
        addLongPressGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindLabels()
        findLabel2(label1)
    }

// Button actions
    
    @objc func label1Tapped(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Countries") as! CountriesViewController
        vc.viewModel?.countryNumber = 1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func label2Tapped(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Countries") as! CountriesViewController
        vc.viewModel?.countryNumber = 2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changeButtonAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        let name = currencyLabel1.text!
        currencyLabel1.text = currnecyLabel2.text
        currencyImage1.image = currencyImage2.image
        currnecyLabel2.text = name
        currencyImage2.image = UIImage(named: name)
        viewModel.saveFirstData(currencyLabel1.text!)
        viewModel.saveSecondData(currnecyLabel2.text!)
        findLabel2(label1)
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        getDate()
        findLabel2(label1)        }
    
    @IBAction func oneButton(_ sender: Any) {
        addNumber("1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        addNumber("2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        addNumber("3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        addNumber("4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        addNumber("5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        addNumber("6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        addNumber("7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        addNumber("8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        addNumber("9")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        addNumber("0")
    }
    
    @IBAction func pointButton(_ sender: Any) {
        let str = label1.text!.removingWhitespacesAndNewlines
        if label1.text!.contains(".") && label1.text! != "0" {
            label1.rx.text.onNext("\(NSString(string: str).doubleValue.formattedWithSeparator)")
        } else {
            label1.rx.text.onNext("\(NSString(string: str).doubleValue.formattedWithSeparator)" + ".")
            let item = FirstNumberData()
            item.number = label1.text!.removingWhitespacesAndNewlines
            FirstNumberPersistance.shared.save(item: item)
        }
    }
    
    @IBAction func cButton(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        let text = label1.text!
        let newText = String(text.dropLast())
        label1.rx.text.onNext(newText)
        viewModel.saveNumberData(label1.text!)
        findLabel2(label1)    }
  
// Setup cButton long press action
    
    @objc func cButtonLongPress(gesture: UILongPressGestureRecognizer) {
        guard let viewModel = viewModel else { return }
        if gesture.state == UIGestureRecognizer.State.began {
            label1.rx.text.onNext("0")
            viewModel.saveNumberData(label1.text!)
            findLabel2(label1)
        }
    }

    func addLongPressGesture(){
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(cButtonLongPress(gesture:)))
        longPress.minimumPressDuration = 0.5
        self.cButton.addGestureRecognizer(longPress)
    }

// Find currency
    
    func findLabel2(_ number: UILabel) {
        label1.rx.text.onNext(number.text?.removingWhitespacesAndNewlines)
        guard let viewModel = viewModel else { return }
        CurrencyParsing().loadRates().map {
            var firstValue: Double = 0
            var secondValue: Double = 0
            var firstKey: String = ""
            var secondKey: String = ""
            for c in $0 {
                if c.key == self.currencyLabel1.text!.removingWhitespacesAndNewlines {
                    firstValue = c.value
                    firstKey = c.key
                }
                if c.key == self.currnecyLabel2.text!.removingWhitespacesAndNewlines {
                    secondValue = c.value
                    secondKey = c.key
                }
            }
            self.currencyLabel.rx.text.onNext("1 \(firstKey) = \(self.viewModel!.formattedNumber(viewModel.findCurrency(firstValue, secondValue)))\(secondKey)")
            number.text! = number.text!.removingWhitespacesAndNewlines
            self.label2.rx.text.onNext("\(self.viewModel!.formattedNumber(viewModel.findCurrency(firstValue, secondValue) * (number.text! as NSString).doubleValue))")
            number.text! = "\(NSString(string: number.text!).doubleValue.formattedWithSeparator)"
        }.subscribe(onDisposed: {
            print("done")
        }).disposed(by: db)
    }
    
    func addNumber(_ str: String) {
        guard let viewModel = viewModel else { return }
        if label1.text != "0" {
            label1.text = label1.text! + "\(str)"
        } else {
            label1.rx.text.onNext(str)
        }
        viewModel.saveNumberData(label1.text!)
        findLabel2(label1)
    }
   
// Setup Image
    
    func setupImageView(_ image: UIImageView) {
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.systemMint.cgColor
        image.layer.borderWidth = 1
    }
  
// Setup labels
    
    func setupLabel1Tap() {
            let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.label1Tapped(_:)))
            self.label1.isUserInteractionEnabled = true
            self.label1.addGestureRecognizer(labelTap)
        }
    
    func setupLabel2Tap() {
            let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.label2Tapped(_:)))
            self.label2.isUserInteractionEnabled = true
            self.label2.addGestureRecognizer(labelTap)
        }
  
// Binding
    
    func bindLabels(){
        for i in FirstCountryPersistance.shared.getItems() {
            currencyLabel1.rx.text.onNext(i.name)
            currencyImage1.rx.image.onNext(UIImage(named: i.image))
        }
        for i in FirstNumberPersistance.shared.getItems() {
            label1.rx.text.onNext(i.number)
        }
        for i in SecondCountryPersistance.shared.getItems() {
            currnecyLabel2.rx.text.onNext(i.name)
            currencyImage2.rx.image.onNext(UIImage(named: i.image))
        }
    }
  
// Getting date
    
    func getDate() {
        dateLabel.rx.text.onNext(viewModel!.getDate())
    }
    
}

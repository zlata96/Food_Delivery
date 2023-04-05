// SoonViewController.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class SoonViewController: UIViewController {
    private var soonView = SoonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = soonView
    }
}

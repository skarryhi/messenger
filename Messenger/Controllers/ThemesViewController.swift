//
//  ThemesViewController.swift
//  Messenger
//
//  Created by Анна Заблуда on 19.10.2021.
//

import UIKit

final class ThemeBatton: UIButton {
    
    func setup(title: String, color: UIColor, target: Any?, action: Selector) {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        backgroundColor = color
        setTitleColor(.black, for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
    }
}

class ThemesViewController: UIViewController {
    
    var logThemeChanging: ((UIColor) -> Void)?
    
    private var themeOne: ThemeBatton = {
        let but = ThemeBatton()
        but.setup(title: "White theme",
                  color: #colorLiteral(red: 0.9615123437, green: 0.9710322679, blue: 0.9710322679, alpha: 1),
                  target: self,
                  action: #selector(theme1))
        return but
    }()
    
    private var themeTwo: UIButton = {
        let but = ThemeBatton()
        but.setup(title: "Yellow theme",
                  color: #colorLiteral(red: 0.957610786, green: 0.9575006366, blue: 0.6299677491, alpha: 1),
                  target: self,
                  action: #selector(theme2))
        return but
    }()
    
    private var themeThree: UIButton = {
        let but = ThemeBatton()
        but.setup(title: "Green theme",
                  color: #colorLiteral(red: 0.8643452525, green: 0.9681846499, blue: 0.7687479854, alpha: 1),
                  target: self,
                  action: #selector(theme3))
        return but
    }()
    
    lazy var stack: UIStackView = {
        let s = UIStackView(frame: CGRect(x: 0, y: view.frame.maxY * 0.1, width: view.frame.width, height: view.frame.height * 0.6))
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 50
        s.addArrangedSubview(themeOne)
        s.addArrangedSubview(themeTwo)
        s.addArrangedSubview(themeThree)
        return s
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stack)
    }
    
    @objc private func theme1() {
        guard let logThemeChanging = logThemeChanging else { return }
        logThemeChanging(.white)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func theme2() {
        guard let logThemeChanging = logThemeChanging else { return }
        logThemeChanging(#colorLiteral(red: 0.957610786, green: 0.9575006366, blue: 0.6299677491, alpha: 1))
        self.dismiss(animated: true, completion: nil)
        #colorLiteral(red: 0.957610786, green: 0.9575006366, blue: 0.6299677491, alpha: 1)
    }
    
    @objc private func theme3() {
        guard let logThemeChanging = logThemeChanging else { return }
        logThemeChanging(#colorLiteral(red: 0.8643452525, green: 0.9681846499, blue: 0.7687479854, alpha: 1))
        self.dismiss(animated: true, completion: nil)
        #colorLiteral(red: 0.8643452525, green: 0.9681846499, blue: 0.7687479854, alpha: 1)
    }
}

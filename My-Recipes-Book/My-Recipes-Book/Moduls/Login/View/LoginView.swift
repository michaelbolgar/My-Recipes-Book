import Foundation
import UIKit
import SnapKit
import Firebase
import FirebaseAuth

//навесить экшены по всем кнопкам

class LoginView: UIView {

    var navigationController: UINavigationController?

    // MARK: - UI Elements

    private lazy var logoView: UIImageView = {
        $0.backgroundColor = Palette.redPrimary20
        return $0
    }(UIImageView())

    private lazy var loginField = UITextField.makeTextfield(text: "login@gmail.com", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: false, securityButton: false)

    private lazy var passwordField = UITextField.makeTextfield(text: "••••••", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: true, securityButton: true)

    private lazy var loginLabel: UILabel = {
        $0.text = "Login"
        $0.numberOfLines = 1
        $0.textAlignment = .center
        //        $0.backgroundColor = .white
        $0.font = UIFont.poppins(weight: .regular, size: 14)
        $0.textColor = Palette.black60
        return $0
    }(UILabel())

    private lazy var passwordLabel: UILabel = {
        $0.text = "Password"
        $0.numberOfLines = 1
        $0.textAlignment = .center
        //        $0.backgroundColor = .white
        $0.font = UIFont.poppins(weight: .regular, size: 14)
        $0.textColor = Palette.black60
        return $0
    }(UILabel())


    private lazy var loginButton: UIButton = {
        $0.setTitle("Log In", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.poppins(weight: .bold, size: 17)
        $0.backgroundColor = Palette.redPrimary50
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var googleButton: UIButton = {
        $0.setTitle("Google", for: .normal)
        $0.setTitleColor(Palette.black80, for: .normal)
        $0.titleLabel?.font = UIFont.poppins(weight: .regular, size: 16)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = Palette.black60.cgColor
        $0.layer.borderWidth = 1
        $0.addTarget(self, action: #selector(googleButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var continueLabel: UILabel = {
        $0.text = "Or continue with"
        $0.numberOfLines = 1
        $0.textAlignment = .center
        //        $0.backgroundColor = .white
        $0.font = UIFont.poppins(weight: .regular, size: 14)
        $0.textColor = Palette.black60
        return $0
    }(UILabel())


    private lazy var signUpView: UITextView = {

        let attributedString = NSMutableAttributedString (string: "Don't have an account yet? Sign up")
        attributedString.addAttribute(.link, value: "signUp://signUp", range: (attributedString.string as NSString).range(of: "Sign up"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: attributedString.length))


        let tv = UITextView()
        tv.delegate = self
        tv.linkTextAttributes = [.foregroundColor: Palette.redPrimary50]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = Palette.black80
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.delaysContentTouches = false
        return tv
    }()


    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let labelCenterX = continueLabel.center.x
        let labelCenterY = continueLabel.center.y

        let leftLine = UIBezierPath()
        leftLine.move(to: CGPoint (x: labelCenterX - 130, y: labelCenterY))
        leftLine.addLine(to: CGPoint(x: labelCenterX - 70, y: labelCenterY))
        UIColor.darkGray.setStroke()
        leftLine.lineWidth = 1.0
        leftLine.stroke()

        let rightLine = UIBezierPath()
        rightLine.move(to: CGPoint (x: labelCenterX + 70, y: labelCenterY))
        rightLine.addLine(to: CGPoint (x: labelCenterX + 130, y: labelCenterY))
        UIColor.darkGray.setStroke()
        rightLine.lineWidth = 1.0
        rightLine.stroke()
    }

    //рассчитать размеры относительно размера экрана
    private func layout() {

        [logoView, loginLabel, loginField, passwordLabel, passwordField, loginButton, continueLabel, googleButton, signUpView].forEach { self.addSubview($0) }

        let updownInset: CGFloat = 12
        let sideInset: CGFloat = 20

        logoView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }

        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(45)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        loginField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginField.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        passwordField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(updownInset / 2)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(updownInset * 2)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        continueLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(updownInset * 4)
            make.centerX.equalToSuperview()
        }

        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueLabel.snp.bottom).offset(updownInset * 2)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        signUpView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).inset(updownInset * 4)
        }
    }


    //MARK: - Selectors

    @objc private func loginButtonAction(_ sender: UIButton) {

        print ("login tapped")
        if let email = loginField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    print("Ошибка входа: \(error.localizedDescription)")
                    self.alertMessage()
                } else {
                    if let user = user {
                        print("Пользователь авторизован: \(user)")
                        let tabbar = CustomTabBarController()
                        self.navigationController?.pushViewController(tabbar, animated: true)
                    }
                }
            }
        }
    }

    @objc private func googleButtonAction() {
        print ("google button tapped")
    }

    // получить доступ к данным текущего пользователя
    //        if let user = Auth.auth().currentUser {
    //            let uid = user.uid
    //            let email = user.email
    //            print (uid, email ?? "no email")
    //        }


    @objc private func alertMessage() {

        let alertMessage = UIAlertController(title: "Error", message: "Incorrect email and/or passwort", preferredStyle: .alert)

        let okButton = UIAlertAction (title: "Ok", style: .default, handler: { (action) -> Void in print ("Ok button tapped")
        })
        
        alertMessage.addAction(okButton)
        if let viewController = self.closestViewController() {
            viewController.present(alertMessage, animated: true, completion: nil)
        }
    }
}

      //MARK: - Extensions

extension UIView {
  func closestViewController() -> UIViewController? {
      var responder: UIResponder? = self
      while let currentResponder = responder {
          if let viewController = currentResponder as? UIViewController {
              return viewController
          }
          responder = currentResponder.next
      }
      return nil
  }
}

extension LoginView: UITextViewDelegate {

  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

      if URL.scheme == "signUp" {
          let createAccountVC = CreateAccountVC()
          self.navigationController?.pushViewController(createAccountVC, animated: true)
      }
      return true
  }
}

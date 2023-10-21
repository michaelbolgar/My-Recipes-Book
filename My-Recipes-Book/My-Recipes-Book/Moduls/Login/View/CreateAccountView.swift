import Foundation
import UIKit
import SnapKit
import FirebaseAuth
import FirebaseFirestore

//навесить экшены по всем кнопкам

/*зарегистрированные пользователи:
логин john@gmail.com , пароль 123456
логин alex@gmail.com , пароль 123456
*/

class CreateAccountView: UIView {

    var navigationController: UINavigationController?

    // MARK: - UI Elements

    private lazy var headerView: UIImageView = {
        let headerImage = UIImage(named: "headerImage")
        $0.image = headerImage
        return $0
    }(UIImageView())

    private lazy var headerLabel: UILabel = {
        $0.text = "Create your account \n explore best recipes"
        $0.numberOfLines = 2
        $0.textAlignment = .center
//        $0.backgroundColor = .white
        $0.font = UIFont.poppins(weight: .bold, size: 28)
        $0.textColor = .white
        return $0
    }(UILabel())

    // поля для textField
    private lazy var firstnameField = UITextField.makeTextfield(text: "Enter your first name", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: false, securityButton: false)

    private lazy var lastnameField = UITextField.makeTextfield(text: "Enter your last name", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: false, securityButton: false)

    private lazy var emailField = UITextField.makeTextfield(text: "Enter your email", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: false, securityButton: false)

    private lazy var passwordField = UITextField.makeTextfield(text: "••••••", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: false, securityButton: false)

    private lazy var confirmField = UITextField.makeTextfield(text: "••••••", textColor: Palette.neutral50, backgroundColor: Palette.neutral10, security: false, securityButton: false)

    // лейблы к каждому textField
    private lazy var firstnameLabel = UILabel.makeLabel(text: "First name", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.black60)
    private lazy var lastnameLabel = UILabel.makeLabel(text: "Last name", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.black60)
    private lazy var emailLabel = UILabel.makeLabel(text: "Email", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.black60)
    private lazy var passwordLabel = UILabel.makeLabel(text: "Password", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.black60)
    private lazy var confirmLabel = UILabel.makeLabel(text: "Confirm password", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.black60)

    // лейблы ошибок
    private lazy var emptyFieldErrorLabel = UILabel.makeLabel(text: "All fields must be filled in", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.redError100)
    private lazy var emailErrorLabel = UILabel.makeLabel(text: "Email must be in @-format", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.redError100)
    private lazy var passwordMatch = UILabel.makeLabel(text: "Passwords do not match", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.redError100)
    private lazy var passwordLength = UILabel.makeLabel(text: "Password must be at least 6 characters long", font: UIFont.poppins(weight: .regular, size: 14), textColor: Palette.redError100)

    // other elements
    private lazy var signupButton: UIButton = {
        $0.setTitle("Sign Up", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.poppins(weight: .bold, size: 17)
        $0.backgroundColor = Palette.redPrimary50
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(signupButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var loginLabel: UITextView = {
        let attributedString = NSMutableAttributedString (string: "Already have an account? Login")
        attributedString.addAttribute(.link, value: "login://login", range: (attributedString.string as NSString).range(of: "Login"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: attributedString.length))

        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
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

    private func layout() {

        [headerView, headerLabel, firstnameLabel, firstnameField, lastnameLabel, lastnameField, emailLabel, emailField, passwordLabel, passwordField, confirmLabel, confirmField, signupButton, loginLabel, emailErrorLabel, passwordMatch, passwordLength, emptyFieldErrorLabel].forEach { self.addSubview($0) }

        emptyFieldErrorLabel.isHidden = true
        emailErrorLabel.isHidden = true
        passwordMatch.isHidden = true
        passwordLength.isHidden = true

        let sideInset: CGFloat = 24
        let updownInset: CGFloat = 6
        let bigUpdownInset: CGFloat = 8

        headerView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(187)
        }

        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(headerView.snp.bottom).inset(updownInset)
        }

        //переделать на функцию с циклом

        //firstname
        firstnameLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(45)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        firstnameField.snp.makeConstraints { make in
            make.top.equalTo(firstnameLabel.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        //lastname
        lastnameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstnameField.snp.bottom).offset(bigUpdownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        lastnameField.snp.makeConstraints { make in
            make.top.equalTo(lastnameLabel.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        //email
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(lastnameField.snp.bottom).offset(bigUpdownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        emailField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        //password
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(bigUpdownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        passwordField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        //confirm password
        confirmLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(bigUpdownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
        }

        confirmField.snp.makeConstraints { make in
            make.top.equalTo(confirmLabel.snp.bottom).offset(updownInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        //other elements
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(confirmField.snp.bottom).offset(bigUpdownInset * 4)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).inset(sideInset)
            make.height.equalTo(45)
        }

        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).inset(60)
        }
    }

    private func wrongTextField(_ textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 5, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 5, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }

    // MARK: - Selectors

    @objc private func signupButtonAction(_ sender: UIButton) {
        print ("sign up tapped")

        emailErrorLabel.isHidden = true
        passwordMatch.isHidden = true
        emptyFieldErrorLabel.isHidden = true
        passwordLength.isHidden = true

        var fieldsArray: [UITextField] = []

        fieldsArray.append(firstnameField)
        fieldsArray.append(lastnameField)
        fieldsArray.append(emailField)
        fieldsArray.append(passwordField)
        fieldsArray.append(confirmField)

        guard let firstName = firstnameField.text, !firstName.isEmpty,
              let lastName = lastnameField.text, !lastName.isEmpty,
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let confirmPassword = confirmField.text, !confirmPassword.isEmpty
        else {
            print ("One or many fields aren't filled in")
            fieldsArray.forEach {
                if $0.text == "" {
                    wrongTextField($0)
                    emptyFieldErrorLabel.isHidden = false
                }
            }
            return
        }

//        guard password == confirmPassword
//        else {
//            print ("Passwords do not match")
//            wrongTextField(passwordField)
//            wrongTextField(confirmField)
//            passwordMatch.isHidden = false
//            return
//        }

        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) {
            (authResult, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                if error.localizedDescription == "The email address is badly formatted." {
                    self.wrongTextField(self.emailField)
                    self.emailErrorLabel.isHidden = false
                } else if error.localizedDescription == "The password must be 6 characters long or more." {
                    self.wrongTextField(self.passwordField)
                    self.passwordLength.isHidden = false
                }
            } else {
                //регистрация прошла успешно
                print ("User \(authResult?.user.email as Any) with name \(firstName) \(lastName) has been successfully registered")

                if let userID = authResult?.user.uid {
                    let db = Firestore.firestore()
                    let userRef = db.collection("users").document(userID)

                    let userData = [
                        "email": email,
                        "firstName": firstName,
                        "lastName": lastName
                    ]

                    userRef.setData(userData) { error in
                      if error != nil {
                            print ("Error when saving user data")
                        } else {
                            print ("User data has been saved in Firestore")
                        }
                    }
                }

                print ("Push home screen")
                let tabbar = CustomTabBarController()
                self.navigationController?.pushViewController(tabbar, animated: true)
            }
        }
    }
}

//MARK: - Extensions

extension CreateAccountView: UITextViewDelegate {

func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

    if URL.scheme == "login" {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    return true
}
}

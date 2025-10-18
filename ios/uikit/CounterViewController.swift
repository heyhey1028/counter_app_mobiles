import UIKit

class CounterViewController: UIViewController {

    // MARK: - Properties

    // カウンターの値
    private var counter = 0 {
        didSet {
            updateCounterLabel()
        }
    }

    // UI Components
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textAlignment = .center
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 60
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let decrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32, weight: .medium)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 60
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("リセット", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [decrementButton, incrementButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }

    // MARK: - Setup

    private func setupUI() {
        title = "カウンターアプリ (UIKit)"
        view.backgroundColor = .systemBackground

        // Add subviews
        view.addSubview(counterLabel)
        view.addSubview(buttonStackView)
        view.addSubview(resetButton)

        // Layout
        NSLayoutConstraint.activate([
            // Counter Label - 画面中央
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            counterLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            counterLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),

            // Button Stack View - カウンターラベルの下
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 60),

            // Individual button sizes
            incrementButton.widthAnchor.constraint(equalToConstant: 120),
            incrementButton.heightAnchor.constraint(equalToConstant: 120),
            decrementButton.widthAnchor.constraint(equalToConstant: 120),
            decrementButton.heightAnchor.constraint(equalToConstant: 120),

            // Reset Button - ボタンスタックビューの下
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 40),
            resetButton.widthAnchor.constraint(equalToConstant: 120),
            resetButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupActions() {
        incrementButton.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(decrementTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func incrementTapped() {
        counter += 1
        animateButton(incrementButton)
    }

    @objc private func decrementTapped() {
        counter -= 1
        animateButton(decrementButton)
    }

    @objc private func resetTapped() {
        counter = 0
        animateButton(resetButton)
        animateCounterLabel()
    }

    // MARK: - Helper Methods

    private func updateCounterLabel() {
        counterLabel.text = "\(counter)"

        // 色の変更（オプション）
        if counter > 0 {
            counterLabel.textColor = .systemBlue
        } else if counter < 0 {
            counterLabel.textColor = .systemRed
        } else {
            counterLabel.textColor = .label
        }
    }

    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
    }

    private func animateCounterLabel() {
        UIView.animate(withDuration: 0.2, animations: {
            self.counterLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.counterLabel.transform = .identity
            }
        }
    }
}

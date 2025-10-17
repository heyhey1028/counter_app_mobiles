package com.example.counter

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    private var counter = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val counterText = findViewById<TextView>(R.id.counterText)
        val messageText = findViewById<TextView>(R.id.messageText)
        val incrementButton = findViewById<Button>(R.id.incrementButton)

        incrementButton.setOnClickListener {
            counter++
            counterText.text = counter.toString()
        }
    }
}

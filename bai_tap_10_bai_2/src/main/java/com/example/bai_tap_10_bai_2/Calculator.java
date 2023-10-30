package com.example.bai_tap_10_bai_2;

import javax.servlet.annotation.WebServlet;

public class Calculator {
    public static float calculate(float num1, float num2, char operator) {
        switch (operator) {
            case '+':
                return num1 + num2;
            case '-':
                return num1 - num2;
            case '*':
                return num1 * num2;
            case '/':
                if (num2 != 0)
                    return num1/num2;
                else
                    throw new RuntimeException("Không thể chia cho 0");
            default:
                throw new RuntimeException("không hợp lệ");
        }
    }
}

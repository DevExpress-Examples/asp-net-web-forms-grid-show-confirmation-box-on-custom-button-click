using System;

public class MyException : Exception {
    public MyException(string message)
        : base(message) {
    }
}
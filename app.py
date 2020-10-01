from flask import Flask
import os

app = Flask(__name__)

def f(n):
    if n < 2:
        return n
    return f(n - 1) + f(n - 2)

@app.route("/")
def hello():
    return "Hello, World!"

@app.route("/fibo/<int:n>")
def fibo(n):
    return "Fibonacci number:" + str(f(n))

@app.route("/health")
def health():
    return "health"

@app.route("/ready")
def ready():
    return "ready"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True,host='0.0.0.0',port=port)

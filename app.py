from flask import Flask
import subprocess


app = Flask(__name__)


@app.route('/')
def hello_cow(text='hello world!'):
    return cowsay(text)


@app.route('/<text>')
def custom_cow(text):
    return cowsay(text)


def cowsay(text):
    try:
        result = subprocess.run(["cowsay", text],
                                capture_output=True, text=True)
        return f"<pre>{result.stdout}</pre>"
    except Exception as e:
        return str(e), 500

from flask import Flask
import os


def notify_mayhem():
    os.kill(os.getpid(), 11)


app = Flask(__name__)


@app.route("/")
def hello():
    html = "<h3>Hello World!</h3>"
    return html.format(html)


@app.route('/user/<username>')
def show_user_profile(username):
    if username == "dbrumley":
        raise
    return 'User %s' % username


if __name__ == "__main__":
    try:
        app.run(host='0.0.0.0', port=80)
    except:
        notify_mayhem()

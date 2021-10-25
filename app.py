from flask import Flask
from flask import render_template
from flask import request
from birthcalc import calc
import os

app = Flask(__name__)

@app.route("/", methods=["POST", "GET"])
def index():
    if request.method == "POST":
        birth_date = request.form["birth"]
        days = calc(birth_date)
        return render_template("result.html", days=days)
    else:
        return render_template("form.html")

if  __name__=='__main__':
    app.run(debug=True, host="0.0.0.0", port=os.environ['PORT']) 

from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/api/addition", methods=["POST"])
def addition():

	nb1 = request.form.get("nombre1")
	nb2 = request.form.get("nombre2")
	# nb1=int(nb1)
	# nb2=int(nb2)
	# res=nb1+nb2
	# res=str(res)
	# res = str(int(nb1) + int(nb1))

	# return res

	return str(int(nb1) + int(nb2))

@app.route("/api/soustraction", methods=["POST"])
def soustraction():

	nb1 = request.form.get("nombre1")
	nb2 = request.form.get("nombre2")
	nb1=int(nb1)
	nb2=int(nb2)
	res=nb1-nb2
	res=str(res)

	return res

@app.route("/api/multiplication", methods=["POST"])
def multiplication():

	nb1 = request.form.get("nombre1")
	nb2 = request.form.get("nombre2")
	nb1=int(nb1)
	nb2=int(nb2)
	res=nb1*nb2
	res=str(res)

	return res

@app.route("/api/division", methods=["POST"])
def division():

	nb1 = request.form.get("nombre1")
	nb2 = request.form.get("nombre2")
	nb1=int(nb1)
	nb2=int(nb2)
	res=nb1/nb2
	res=str(int(res))

	return res


if __name__ == "__main__":
	app.run(debug=True)
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

@app.route("/api/operation", methods=["POST"])
def operation():

	operation = request.form.get("operation")
	nb1 = request.form.get("nombre1")
	nb2 = request.form.get("nombre2")
	nb1=int(nb1)
	nb2=int(nb2)
	# addition="+"
	# soustraction="-"
	# multiplication="*"
	# division="/"



	if(operation=="addition"):
		# signe=addition
		signe="+"
		res=nb1+nb2
	elif(operation=="soustraction"):
		# signe=soustraction
		signe="-"
		res=nb1-nb2
	elif(operation=="multiplication"):
		# signe=multiplication
		signe="*"
		res=nb1*nb2
	elif(operation=="division"):
		# signe=division
		signe="/"
		res=nb1/nb2
	else:
		raise Exception("Please choose an operation")

	# match operation:
	# 	case "addition":
	# 		res=nb1+nb2
	# 	case "soustraction":
	# 		res=nb1-nb2
	# 	case "multiplication":
	# 		res=nb1*nb2
	# 	case "division":
	# 		res=nb1/nb2
	# 	case _:
	# 		raise Exception("Please choose an operation")



	res=f"{nb1} {signe} {nb2}={res}"
	# res=str(nb1) + " " + operation + " " + str(nb2) + " = " + str(res)

	return res


if __name__ == "__main__":
	app.run(debug=True)

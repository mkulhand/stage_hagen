from flask import Flask, render_template, request

app = Flask(__name__)

def get_params():
	nb1 = request.form.get("nombre1")
	nb2 = request.form.get("nombre2")

	return [int(nb1), int(nb2)]

def get_nb1():
	nb1 = request.form.get("nombre1")
	return int(nb1)

def get_nb2():
	nb2 = request.form.get("nombre2")
	return int(nb2)

def do_addition(nb1, nb2):
	return str(nb1+nb2)

def do_soustraction(nb1,nb2):
	return str(nb1-nb2)

def do_multiplication(nb1,nb2):
	return str(nb1*nb2)

def do_division(nb1,nb2):
	return str(int(nb1/nb2))

# f"{nb1} {signe} {nb2}={res}"
def prepare_result(nb1,signe,nb2,res):
	return f"{nb1} {signe} {nb2}={res}"


@app.route("/")
def home():
    return render_template("index.html")

@app.route("/api/addition", methods=["POST"])
def addition():

	# nb1, nb2 = get_params()

	nb1 = get_nb1()
	nb2 = get_nb2()
	res=do_addition(nb1,nb2)


	# nb1 = request.form.get("nombre1")
	# nb2 = request.form.get("nombre2")
	# nb1=int(nb1)
	# nb2=int(nb2)
	# res=nb1+nb2
	# res=str(res)

	# return str(int(nb1) + int(nb2))
	return res


@app.route("/api/soustraction", methods=["POST"])
def soustraction():

	nb1 = get_nb1()
	nb2 = get_nb2()
	res=do_soustraction(nb1,nb2)

	# nb1 = request.form.get("nombre1")
	# nb2 = request.form.get("nombre2")
	# nb1=int(nb1)
	# nb2=int(nb2)
	# res=nb1-nb2
	# res=str(res)

	return res

@app.route("/api/multiplication", methods=["POST"])
def multiplication():

	nb1 = get_nb1()
	nb2 = get_nb2()
	res=do_multiplication(nb1,nb2)

	# nb1 = request.form.get("nombre1")
	# nb2 = request.form.get("nombre2")
	# nb1=int(nb1)
	# nb2=int(nb2)
	# res=nb1*nb2
	# res=str(res)

	return res

@app.route("/api/division", methods=["POST"])
def division():

	nb1 = get_nb1()
	nb2 = get_nb2()
	res=do_division(nb1,nb2)

	# nb1 = request.form.get("nombre1")
	# nb2 = request.form.get("nombre2")
	# nb1=int(nb1)
	# nb2=int(nb2)
	# res=nb1/nb2
	# res=str(int(res))

	return res

@app.route("/api/operation", methods=["POST"])
def operation():

	operation = request.form.get("operation")
	nb1 = get_nb1()
	nb2 = get_nb2()

	# nb1 = request.form.get("nombre1")
	# nb2 = request.form.get("nombre2")
	# nb1=int(nb1)
	# nb2=int(nb2)
	# addition="+"
	# soustraction="-"
	# multiplication="*"
	# division="/"



	if(operation=="addition"):
		# signe=addition
		signe="+"
		res=do_addition(nb1,nb2)
		# res=nb1+nb2
	elif(operation=="soustraction"):
		# signe=soustraction
		signe="-"
		res=do_soustraction(nb1,nb2)
		# res=nb1-nb2
	elif(operation=="multiplication"):
		# signe=multiplication
		signe="*"
		res=do_multiplication(nb1,nb2)
		# res=nb1*nb2
	elif(operation=="division"):
		# signe=division
		signe="/"
		res=do_division(nb1,nb2)
		# res=nb1/nb2
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


	res=prepare_result(nb1,signe,nb2,res)
	# res=f"{nb1} {signe} {nb2}={res}"
	# res=str(nb1) + " " + operation + " " + str(nb2) + " = " + str(res)

	return res


if __name__ == "__main__":
	app.run(debug=True)

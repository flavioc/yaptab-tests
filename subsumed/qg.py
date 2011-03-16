
def generate_ints(max):
	ret = []
	for a in range(max):
		ret.append(str(a))
	return ret

def generate_general(spec):
	if spec[0] == "c":
		return [spec[1]]
	if spec[0] == "i":
		return generate_ints(int(spec[1]))
	elif spec[0] == "f":
		return generate_functor(spec[1], spec[2])
	elif spec[0] == "l":
		return generate_list(spec[1])

def combine_list_aux(list, current, args):
	if len(args) == 0:
		list.append(current + "]")
	else:
		arg = args[0]
		rem = args[1:]
		for a in arg:
			str = current
			if len(str) > 0:
				str = str + ", "
			else:
				str = "["
			str = str + a
			combine_list_aux(list, str, rem)

def combine_list(args):
	ret = []
	combine_list_aux(ret, "", args)
	return ret

def combine_functor_aux(list, name, current, args):
	if len(args) == 0:
		list.append(current + ")")
	else:
		arg = args[0]
		rem = args[1:]
		for a in arg:
			str = current
			if len(str) == 0:
				str = name + "("
			else:
				str = str + ", "
			str = str + a
			combine_functor_aux(list, name, str, rem)

def combine_functor(name, args):
	ret = []
	combine_functor_aux(ret, name, "", args)
	return ret

def generate_list(spec):
	all = []
	for a in spec:
		all.append(generate_general(a))
	return combine_list(all)

def generate_functor(name, args):
	all = []
	for a in args:
		all.append(generate_general(a))
	return combine_functor(name, all)

def generate_random(pred, spec):
	all = generate_functor(pred, spec)
	for a in all:
		print a + "."

def generate_to_file(file, pred, spec):
	f = open(file, "w")
	all = generate_functor(pred, spec)
	for a in generate_functor(pred, spec):
		f.write(a + ".\n")
	f.close()

i10 = ("i", 10)
i100 = ("i", 100)
i1000 = ("i", 1000)
const = ("c", "'c'")
i2 = ("i", 2)
#generate_random("p", [i10, ("f", "t", [i10, ("l", [i10, i10])]), i10])

generate_to_file("retro_data100.pl", "p", [i10, ("f", "t", [i10]), ("f", "p", [const, i2])])
generate_to_file("retro_data1000.pl", "p", [i100, ("f", "t", [i100]), ("f", "p", [const, i2])])
generate_to_file("retro_data10000.pl", "p", [i1000, ("f", "t", [i1000]), ("f", "p", [const, i2])])


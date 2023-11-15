def main(*problems):
	last = None
	for i in problems:
		if last is not None and i - last > 1:
			print(f"\t\\setcounter{{problemsi}}{{{i-1}}}")
		print(f"\t\\problem\t\t\t% TODO: Problem {i}")
		last = i


if __name__ == "__main__":
	main(3, 4, 9, 11, 14, 15, 16, 19, 23, 29, 31, 32, 39, 41, 42, 47, 48, 51, 52, 55)

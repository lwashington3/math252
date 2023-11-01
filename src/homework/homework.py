def main(*problems):
	last = None
	for i in problems:
		if last is not None and i - last > 1:
			print(f"\t\\setcounter{{problemsi}}{{{i-1}}}")
		print(f"\t\\problem\t\t\t% TODO: Problem {i}")
		last = i

if __name__ == "__main__":
	main(1, 4, 7, 8)

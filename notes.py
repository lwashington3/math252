from datetime import date
from xml.etree import ElementTree


def create_tex_file(date:date, datefmt:str, file:str):
	with open(file, 'w') as f:
		f.write(fr"""%! Author = Len Washington III
%! Date = {date:%#m/%d/%Y}

% Preamble
\documentclass[12pt]{{report}}

% Packages
\usepackage[title={{{date.strftime(datefmt)} Notes}}]{{math252notes}}

% Document
\begin{{document}}

\setcounter{{chapter}}{{}}
\chapter{{}}\label{{ch:}}
\setcounter{{section}}{{}}
%<*Section->
\section{{}}\label{{sec:}}

%</Section->

\end{{document}}""")


def create_notes_conf(root:ElementTree, date:date, datefmt, month, texfile):
	manager = root.find("./component[@name='RunManager']")

	notes = ElementTree.SubElement(manager, "configuration", attrib={"name": date.strftime(f"{datefmt} Notes"),
																	 "type": "LATEX_RUN_CONFIGURATION",
																	 "factoryName": "LaTeX configuration factory",
																	 "folderName": f"{month} Notes"}
	)

	texify = ElementTree.SubElement(notes, "texify")
	ElementTree.SubElement(texify, "compiler").text = "PDFLATEX"
	ElementTree.SubElement(texify, "compiler-path")
	ElementTree.SubElement(texify, "sumatra-path")
	ElementTree.SubElement(texify, "pdf-viewer").text = "NONE"
	ElementTree.SubElement(texify, "viewer-command").text = "opener"
	ElementTree.SubElement(texify, "compiler-arguments")
	ElementTree.SubElement(texify, "envs")
	ElementTree.SubElement(texify, "main-file").text = f"$PROJECT_DIR$/src/notes/{texfile}"
	ElementTree.SubElement(texify, "output-path").text = "$PROJECT_DIR$/out/notes"
	ElementTree.SubElement(texify, "auxil-path").text = "$PROJECT_DIR$/auxil/notes"
	ElementTree.SubElement(texify, "compile-twice").text = "false"
	ElementTree.SubElement(texify, "output-format").text = "PDF"
	ElementTree.SubElement(texify, "latex-distribution").text = "MIKTEX"
	ElementTree.SubElement(texify, "has-been-run").text = "false"
	ElementTree.SubElement(texify, "bib-run-config").text = "[]"
	ElementTree.SubElement(texify, "makeindex-run-config").text = f"[Makeindex.{date.strftime(datefmt)} Makeindex]"

	ElementTree.SubElement(notes, "method", attrib={"v": "2"})


def create_makeindex_conf(root:ElementTree, date:date, datefmt, month, texfile):
	manager = root.find("./component[@name='RunManager']")

	notes = ElementTree.SubElement(manager, "configuration", attrib={"name": date.strftime(f"{datefmt} Makeindex"),
																	 "type": "MAKEINDEX_RUN_CONFIGURATION",
																	 "factoryName": "LaTeX configuration factory",
																	 "folderName": f"{month} Notes"}
	)

	makeindex = ElementTree.SubElement(notes, "texify-makeindex")
	ElementTree.SubElement(makeindex, "program").text = "MAKEINDEX"
	ElementTree.SubElement(makeindex, "main-file").text = f"$PROJECT_DIR$/src/notes/{texfile}"
	ElementTree.SubElement(makeindex, "command-line-args")
	ElementTree.SubElement(makeindex, "work-dir").text = "$PROJECT_DIR$/auxil/notes"

	ElementTree.SubElement(notes, "method", attrib={"v": "2"})


def add_confs_to_list(root:ElementTree, date:date, datefmt):
	manager = root.find("./component[@name='RunManager']/list")

	ElementTree.SubElement(manager, "item", attrib={"itemvalue": f"LaTeX.{date.strftime(datefmt)} Notes"})
	ElementTree.SubElement(manager, "item", attrib={"itemvalue": f"Makeindex.{date.strftime(datefmt)} Makeindex"})


def main(date:date):
	datefmt = "%b %d, %Y"
	month = date.strftime("%B")
	file = date.strftime("%#m-%d-%Y.tex")

	tree = ElementTree.parse(".idea/workspace.xml")
	root = tree.getroot()

	create_tex_file(date, datefmt, f"src/notes/{file}")
	create_notes_conf(root, date, datefmt, month, file)
	create_makeindex_conf(root, date, datefmt, month, file)
	add_confs_to_list(root, date, datefmt)

	tree.write(".idea/workspace.xml")


if __name__ == "__main__":
	main(date.today())

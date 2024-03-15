# FAMNIT

![GitHub release (latest by date)](https://img.shields.io/github/v/release/Tiggax/famnit_typst_template)
![GitHub Repo stars](https://img.shields.io/github/stars/Tiggax/famnit_typst_template)

![logo](https://www.famnit.upr.si/img/UP_FAMNIT.png)

*University of Primorska,*

*Faculty of Mathematics, Natural Sciences and Information Technologies*

---

This is a Typst template for FAMNIT final work.

# Configuration

---

## configuration example

```typst
#import "@preview/famnit:0.1.0": project

#show project.with(
	date: datetime(day: 1, month: 1, year: 2024), // you could also do `datetime.today()`
	text_lang: "en" // the language that the thesis is gonna be written in.
	
	author: "your name"
	studij: "your course",
	mentor: "your mentor"
	somentor: none, // if you have a co-mentor write him here, else you can just remove the line.

	naslov: "your title in slovene",
	title: "your title",

	izvleček: [
		your abstract in slovene.
	],
	abstract: [
		your abstract
	],

	ključne_besede: ("Typst", "je", "super!"),
	key_words: ("Typst", "is", "Awesome!"),

	kratice: (
		"Famnit": "Fakulteta za matematiko naravoslovje in informacijske tehnologije",
		"PDF": "Portable document format",
	),

	priloge: (), // you can add attachments as a dict of a title and content like `"name": [content],`

	zahvala: [
		you can add an acknowlegment.
	],

	/* Additional content and their defaults
 	kraj: "Koper",
	bib_file: "bibliography.bib",
	*/
)

// Your content goes below.

```

## Attachments

Some thesis need Attachments that are shown at the end of the file.
To add these attachments add them in your project under `priloge` as a dictionary of the attachment name and its content.
I suggest having a seperate `attachments.typ` file, from where you can reference them in the main project.

## Language

The writing of the thesis can be achieved in two languages; Slovene and English.
They have some differences between them in the way the template is generated, as the thesis needs to be different for each one.
you can specify the language with the `text_lang` attribute.


---

If you have any questions, suggestion or improvements open an issue or a pull request [here](https://github.com/Tiggax/famnit_typst_template)

#let col = (
  gray: rgb(128,128,128),
)

#let todo = [
  #set text(fill: red)
  *TODO*
]

#let split_author(author) = {
  let a_list = author.split(" ")
  (name: a_list.at(0), surname: a_list.slice(1).join(" ") )
}

#let surname_i(author) = {
  let author = split_author(author)
  (author.surname, " ", author.name.at(0), ".").join()
}


#let project(
  title: "Naslov zaključne naloge",
  title_eng: "Title of the final work",
  kljucne_besede: ("typst", "is", "awesome!"),
  abstract: [],
  author: "Samo Primer",
  studij: "Ime študijskega programa",
  mentor: "",
  somentor: none,
  kraj: "Koper",
  date: datetime(day: 1, month: 1, year: 2024),
  zahvala: none,
  kratice: (
    ("ICO", "An icon"),
    ("TTE", "Telecom Text Engine")
  ),
  priloge: (),
  body,
) = {
  let auth_dict = split_author(author)
  
  
  set document(author: (author), title: title, keywords: kljucne_besede)

  let header(dsp) = [
    #set text(size: 10pt, fill: col.gray, top-edge: "cap-height")
    #surname_i(author) #title.\
    Univerza na Primorskem, Fakulteta za matematiko, naravoslovje in informacijske tehnologije,#date.year()
    #h(1fr)
    #counter(page).display(dsp)
    #line(start: (0pt,-6pt), length: 100%, stroke: col.gray + 0.5pt)
  ]
  
  set page(
    numbering: "1", 
    number-align: center, 
    //margin: (left: 3cm, top: 3cm),
    header: header("I"),
    header-ascent: 0cm,
    footer-descent: 1.5cm,
    footer: []
  )
  set text(
    font: "Times New Roman", 
    lang: "sl", 
    size: 12pt
  )

  show footnote: it => text(size: 10pt, it)
  
  set heading(numbering: "1.1")
  
  show heading.where(level: 1): it => text(size: 14pt, weight: "bold",upper(it))
  show heading.where(level: 2): it => text(size: 14pt, weight: "regular", upper(it))
  show heading.where(level: 3): it => text(size: 12pt, weight: "bold", it)
  show heading.where(level: 4): it => text(size: 12pt, weight: "regular", it)

  show outline.entry.where(level: 1): it => upper(it)
  
  show figure.caption: it => text(size: 10pt,it)

  show bibliography: set heading(numbering: "1.1")
  
  
  
  // --------- COVER PAGE --------------
  page(header: none, margin: (bottom: 5cm))[
    #set text(size: 14pt, spacing: 0.28em)
    #set align(center)

    
    UNIVERZA NA PRIMORSKEM\
    FAKULTETA ZA MATEMATIKO, NARAVOSLOVJE IN\
    INFORMACIJSKE TEHNOLOGIJE

    #align(center + horizon)[ZAKLJUČNA NALOGA]
    #align(center + horizon)[
      #set text(size: 18pt)
      #upper(title)
    ]
    #set align(right + bottom)
    #upper(author)
  ]
  
  // --------- Header ---------------
  page(header:none)[
    #set text(size: 14pt)
    #set align(center)
    UNIVERZA NA PRIMORSKEM\
    FAKULTETA ZA MATEMATIKO, NARAVOSLOVJE IN\
    INFORMACIJSKE TEHNOLOGIJE

    #align(center + horizon)[
      #set text(size: 12pt)
      Zaključna naloga

      #text(size: 14pt)[*#title*]
      
      (#title_eng)
    ]
    #v(5em)
    #align(left)[
      Ime in priimek: #author\
      Študijski program: #studij\
      Mentor: #mentor\
      #if somentor != none [Somentor: #somentor\ ]
    ]
    #align(bottom + center)[
      #kraj, #date.year()
    ]
    
    #counter(page).update(1)
  ]

  // ----------- zahala -----------------
  if zahvala != none {
    page()[
      *ZAHVALA*
      #v(2em)
      #zahvala
    ]
  }
  let item_counter(target, prefix) = locate(loc => {
        let cnt = counter(target).final(loc).first()
        if cnt > 0 {
          [#prefix: #cnt]
        }
      })
  let number_of_content() = locate(loc =>  {
    let p_cnt = counter(page)
    [#p_cnt.at(query(<body_end>, loc).first().location()).first()]
  })




  
  // ---- Ključna dokumentacija ----
  page()[
    #h(1fr)*Ključna dokumentacijska informacija*
    
    #box(
      stroke: black + 0.5pt,
      inset: 0.5em,
      width: 100%,
    )[
      
      Ime in PRIIMEK: #auth_dict.name #upper(auth_dict.surname)

      Naslov zaključne naloge: #title

      #v(3em)
      
      Kraj: #kraj
      
      Leto: #date.year()

      Število strani: #number_of_content()
      #h(0.5fr)
      #item_counter(figure.where(kind: image), "Število slik")
      #h(0.5fr)
      #item_counter(figure.where(kind: table), "Število tabel")
      #h(1fr)
      
      #item_counter(figure.where(kind: "priloga"), "Število prilog") 
      #h(0.5fr)
      #item_counter(figure.where(kind: image), "Št. strani prilog")
      #h(2fr)

      #item_counter(ref.where(), "Število referenc")


      Mentor: #mentor

      #if somentor != none [
        Somentor: #somentor
      ]

      Ključne besede: #kljucne_besede.join(", ")

      Izvleček: 
      
      #abstract
      
      
    ]
  ]

  // ---- Ključna dokumentacija (eng)----

  page()[
    #h(1fr)*Ključna dokumentacijska informacija*
    
    #box(
      stroke: black + 0.5pt,
      inset: 0.5em,
      width: 100%,
    )[
      
      Name and SURNAME: #auth_dict.name #upper(auth_dict.surname)

      Title of the final project paper: #title
      
      #v(3em)
      
      Place: #kraj
      
      Year: #date.year()
      
      


      // Če zaključna naloga ne vključuje slik, tabel ali prilog se polja: Number of slik, Number of tabel, Number of prilog in Number of strani prilog ne navajajo. Enako velja za angleški prevod ključne dokumentacijske *informacije.*


      Number of pages: #number_of_content()
      #h(0.5fr)
      #item_counter(figure.where(kind: image), "Number of figures")
      #h(0.5fr)
      #item_counter(figure.where(kind: table), "Number of tables")
      #h(1fr)
      
      #item_counter(page, "Number of appendix") 
      #h(0.5fr)
      #item_counter(figure.where(kind: image), "Number of appendix pages")
      #h(2fr)

      #item_counter(ref.where(), "Number of references") 


      Mentor: #mentor

      #if somentor != none [
        Co-mentor: #somentor
      ]

      Keywords: #kljucne_besede.join(", ")

      Abstract: #abstract
      
      
    ]
  ]

  // -------- TABLES ----------
  let tablepage(target, title) = locate(loc => {
    let count = counter(target).final(loc).first()

    if count != 0 {
      page(header: header("I"), outline(target: target, title: title))
    } else {
      none
    }
  })
  
  
  set page(header: header("1"))
  
  tablepage(heading, "Kazalo vsebine")
  

  tablepage(figure.where(kind: table), "Kazalo preglednic")// todo tables?

  tablepage(figure.where(kind: image), "Kazalo slik in grafikonov")

  tablepage(figure.where(kind: raw), "Kazalo prilog")// TODO priloge
  
  // kratice
  if kratice != none {
    page(header: header("I"))[
      *Kratice*
      
      #kratice.map( pair => {
        let short = pair.at(0)
        let desc = pair.at(1)
        
        [/ #short: #desc #label(short)]
      }).join("")
      #counter(page).update(0)
    ]

  }

  show ref: it => {
    if it.element in kratice.map(p => [#p.at(1)]) {
      let tar = str(it.target)
      if it.citation.supplement != none {
        let sup = it.citation.supplement
        link(it.target)[#tar\-#sup]
      } else {
        link(it.target)[#tar]
      }
    } else {
      it
    }
  }
  
  // Main body.
  set par(justify: true)
  set page(header: header("1"))

  [#metadata(none) <body_start>]
  
  body
  
  [#metadata(none) <body_end>]

  pagebreak()
  bibliography(
    "my_references.bib", 
    style: "ieee",
    title: "Viri in literatura"
  )
  
  let priloga_counter = counter("priloga")
  
  let prilogb(x) = locate(loc => {

    let a = priloga_counter.at(loc).first()
    
    let cnt = [
      #figure(supplement: [Priloga], kind: "Priloga",[])
      #label("Pr_" + str(a))
      #x 
    ]
    cnt
  })

  

  for name in priloge {
    priloga_counter.step()
    
    set page(
      header: align(right)[Priloga #priloga_counter.display("A")], 
        header-ascent: 1cm
    )
    prilogb(name)
  }
  
}
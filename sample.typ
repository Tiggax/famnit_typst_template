#import "template.typ": *
#import "priloge.typ" as pr

#show: project.with(
  title: "Primer naloge",
  title_eng: "Sample of the final work",
  author: "Samo Primer",
  mentor: "dr. Oge Sokul",
  somentor: "dr. retker",
  abstract: lorem(100),
  zahvala: lorem(50),
  kratice: (
    ("PR", "Primer uporabljen za testiranje kratice"),
    ("RFG", "Reichtages Freung Grangen"),
    ("FRI", "Free republic of iran"),
  ),
  kljucne_besede: ("Typst", "Is", "Awesome"),
  priloge: (
    pr.a,
    pr.b,
  )
)



= Uvod <uvod>

Zaključna naloga je avtorsko delo, s katerim študent dokazuje poglobljeno znanje na širših 
strokovnih in znanstvenih področjih, usposobljenost za iskanje novih virov znanja na 
določenem strokovnem in znanstvenem področju, za uporabo znanstveno-raziskovalnih 
metod v širšem spektru problemov in v novih ali spremenjenih okoliščinah, sposobnost za 
prevzemanje odgovornosti za vodenje zahtevnejših delovnih sistemov ter za razvijanje 
kritične refleksije.

= Pisanje Z uporabo TYPST-a

_Ležečo_ pisavo lahko uporabljamo za poudarke v besedilu.

uporaba je enostavna, in podobna sintaksi markdowna in ostalih podobnih jezikov.

vsak nov naslov uporabi `=` za nastavitev naslova za podnaslove pa se samo poveča število le teh.
== osnovni text

- točke 
- so 
- enostavne
- in
- berlijve

+ prav
+ tako 
+ zaporedne

#[
#set enum(numbering: "a)")

+ to bo a 
+ to bo b
+ to bo c
]


lahko pišem _postrani_ ali *krepko* #footnote()[Krepko se uporablja za poudarke besed]

=== Pisanje matematičnih enačb

Za pisanje enačb lahko enostavno uporabimo `$$` za uporabo matematičnega načina.
Tako lahko na primer napišemo $sum_(i=2)^5 n^2$, znotraj teksta, ali pa ustvarimo novo vrsto z:


$
sum_(k=0)^n k + 2 = 2 + 3 + ... + n + (n + 1) + (n + 2)
$


lahko se tudi doda številčenje: 
#set math.equation(numbering: "1.1")

$ 
x + y = 1
$ <prva>

$ 
x + z = 2
$ <druga>

kjer se lahko tudi enačbe referencira kot @prva. Tako lahko vidimo da je @druga bolj kul od  @prva[Enačbe]

== funkcije

Typst ima mnogo funkcij. če jih želimo vključiti v obseg texta, se pred funkcijam vstavi `#`. #range(5).map(i => [#i]).join(" in ").

== Reference

Referenciranje je enostavno z `@<ime>` kot na primer @darwin_1859_on.

Iran je postal država @FRI.

#pagebreak()
== figure
za vstavitev tabele naredimo:

#let rng = range(6)
#figure(
  caption: [Enostavna tabela],
  table(
    columns: rng.len() + 1,
    [$x$], ..rng.map(i => [#i]),
    [$f(x) = 2x$], ..rng.map(i => [#(2 * i)]),
    [$f(x) = x^2$], ..rng.map(i => [#calc.pow(i, 2)]),
    [$f(x) = log_2 x$], ..rng.map(i => if i > 0 [#calc.log(i, base: 2)] else [undefined])
  )
)
Tabela se sama od sebe vstavi v pravilno kazalo.
če želimo bolj napredne funkcije z tabelami, se lahko pogleda paket
#text(fill: blue, link("https://github.com/typst/packages/tree/main/packages/preview/tablex/0.0.8","tablex")) za uporabo.

podobno se lahko vstavljajo figure kot so slike.



Kratice so tudi vspostavljene, da se jih lahko referencira, kar ustvari link za hitrješe branje ko naprimer pri @RFG[ju]

#figure(
  caption: [Slika famnit logotipa],
  image("image.png", width: 80%)
)

= zaključek <zakljucek>

vsaka naloga potrebuje imeti `= Uvod <uvod>` in `= Zaključek <zakljucek>` v vsebini, da lahko preračuna število strani med njima.

#lorem(519)

@Pr_2
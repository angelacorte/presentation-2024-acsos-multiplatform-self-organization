#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // footer: [Optional Footnote]
)

#set text(font: "Inter", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)
#show figure.caption: set text(size: 14pt)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show table.cell: it => {
  if it.body == [*x*] {
    set text(red)
    it
  } else if it.body == [*\u{2713}*] {
    set text(green)
    it
  } else if it.body == [*\u{007E}*] {
    set text(yellow.darken(20%))
    it
  } else {
    it
  }
}

#let author = box[
  #table(inset: 0.5em, stroke: none, columns: (1fr, auto),  align: (left, right),
    [*Angela Cortecchia*], [angela.cortecchia\@unibo.it],
    [Supervisor: Prof. _Danilo Pianini_],[GARR research fellow &\ (soon) PhD student \@UniBo]
  )
  #place(left, dy:3em)[
    #figure(image("figures/qr.svg", width:10%))
  ]
  #place(right, dy:3em)[
    #figure(image("images/disi.svg", width:25%))
  ]
]

#title-slide(
  title: "Multiplatform Self-Organizing Systems Through a Kotlin-MP Implementation of Aggregate Computing",
  author: author,
)

#new-section-slide("Why?")

#let motivation = box[
  #table(inset: 1.1em, stroke: none, columns: (1.5fr, 1.1fr), align: (left, left),
     [
      In smart cities scenarios e.g. #underline[crowd management] and #underline[surveillance], drones and sensors can help monitor the environment.

      #underline[*Challenges*]: heterogeneity, scalability, and fault tolerance.

      Among the existing frameworks, *Aggregate Computing* (AC) can help to address these challenges.
    ], [
      #figure(
        image("figures/smartcity.png", width: 120%),
      )
    ]
  )
]

#slide(title: "Motivation")[
  #motivation
]

#new-section-slide("What?")

#slide(title: "Aggregate Computing")[
  #table(inset: 0.3em, stroke: none, columns: (1fr), align: (center),[
    #figure(
    image("figures/acDevices.png", width: 80%),
    )
  ],[
  AC defines the *collective behavior* of devices in self-organizing systems.

  It manipulates distributed data structures called "*fields*".
  ])
  
  
]

#slide(title: "State of the Art")[
  #figure(
    image("figures/SOTA.svg", width: 100%),
  )
]

#new-section-slide[What if we change the compiler?]

#slide(title: "Contribution")[
  #figure(
    image("figures/SOTAtable.svg", width: 100%),
  )
  A DSL-prototype in Kotlin Multiplatform called Collektive!
]

#new-section-slide("How?")

#slide(title: "Example")[
  #figure(
    image("figures/code.png", width: 82%),
  )
]

#new-section-slide("Potential impact")

#slide(title: "Application")[

  #table(inset: 1.2em, stroke: none, columns: (1.5fr, 1.5fr), align: (left, left),
     [
      #figure(
       image("figures/channel.png", width: 79%),
  )
    ], [
      The approach is viable: the prototype has been used to reproduce some experiments.
    ]
  )


  
]

#slide(title: "Future Works")[
  #table(inset: 1.2em, stroke: none, columns: (1.5fr, 1fr), align: (left, left),
     [
      Current AC systems run a *single complex algorithm*, but in dynamic environments a *flexible management* is needed.

    Programs should be added, removed or paused *at runtime*.

    Concepts similar to modern OSs -> idea of *collective operating systems*.

    ], [
      #figure(
        image("figures/devs.svg", width: 100%),
      )
    ]
  )
]

#let desc = box[
  #table(inset: 1em, stroke: none, columns: (1fr, 1fr,  1fr), align: (left, left, left),
    [[+, if, then -> nbr(v#sub[1])],\ [+, f -> nbr(v#sub[2])]],
    [[+, if, then -> nbr(v#sub[1])],\ [+, h -> nbr(v#sub[3])]],
    [[+, if, else -> nbr(v#sub[2])],\ [+, h -> nbr(v#sub[3])]]
  )
]

#let alignment = box[
  #table(inset: 0.5em, stroke: none, columns: (1fr),  align: (center),
  [#figure(
    image("figures/alignment.svg", width: 88%),
  )],
    [\ #desc]
  )
]

// #slide(title: "Alignment")[
//   #alignment
// ]

// #slide(title: "Transparent Alignment")[
//   #set table(
//     fill: (x, y) =>
//       if x == 0 or y == 0 {
//         blue.lighten(80%)
//       },
//     align: right,
//   )
  
//   #table(
//     columns: (6em, 4.5em, 3em, 2em, 5.4em, 5em, 6.5em),
//     inset: 7pt,
//     align: (left, center, center, center, center, center, center, center),
//     table.header(
//       [Language], [DSL Type], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], 
//     ),
//     [*Proto*],[external],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],
//     [*Protelis*],[external],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],
//     [*ScaFi*],[internal],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],
//     [*FCPP*],[internal c++],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],
//   )

//   Devices can communicate between each other without an explicit notion of "sending messages".
  
//   // i dispositivi riescono a comunicare tra di loro senza di fatto una nozione esplicita di 'mando messaggi'
//   // questa capacità di comunicare con altri dispositivi in punti arbitrari del codice viene chiamata allineamento

//   // l'ideale dal punto di vista di chi realizza sw aggregato è che non debba gestire a mano l'allineamento, a meno che non ci siano moenti specifici in cui si vuole andare a basso livello a controllare
//   // perche io scrivo in modo trasparente manipolando i field e assumo che sotto ciò venga gestito automaticamente, se fossero chiamate a libreria però sarebbero esplicite e quindi meno trasparenti, idem per le macro (fcpp)
//   // oppure può essere un sistema completamente nascosto che non si vede, a runtime

  
//   // non devi spiegare al compilatore cosa annotare
// ]

// #slide(title: "Example of non-trasparent alignment")[
//   ```cpp
//   field<double> f = nbr(CALL, 4.2); // nbr with single value
//   int x = old(CALL, 0, [&](int a){  // old with initial value and update function
//     return a+1;
//   });
//   int y = nbr(CALL, 0, [&](field<int> a){ // nbr with initial value and update function
//     return min_hood(CALL, a);
//   });
//   ```
//   *FCPP* requires the use of macros to align, which results in a lack of transparency. 
// ]

// #let programs = box[
//   #table(inset: 0.5em, stroke: none, columns: (1fr, 1fr),  align: (left, left),
//     // [Program \#1],[Program \#2],
//     [
//       ```scala
//        nbr(1) :: nbr(2) :: Nil //list
//        ```
//     ], 
//     [
//       ```scala
//        (nbr(1), nbr(2)) //tuple
//       ```
//     ]
//   )
// ]


// #slide(title: "Complete or Partial Alignment")[  
//   Two structurally different programs should not align.

//   #programs

//   In *ScaFi*, however, they align.

//   // l'allineamento completo è quando non hai due programmi strutturalmente diversi che fra di loro si allineano (esempio della tesi)
//   // [programmi strutturalmente diversi non devono alinnearsi]
//   // esempio con scafi e protelis? 

//   // //those programs are different and should not be aligned
//   // (in scafi allineano)
//   // //they must not align because one is a concat operation and the other is the construction of a tuple, so the result of the programs are different types
//   // conto a quale nbr siamo arrivati, quindi la struttura astrae da quello che c'e intorno
//   // mentre in collektive sono due cose diverse 
// ]

// #slide(title: "Overview")[
//   #set table(
//     fill: (x, y) =>
//       if x == 0 or y == 0 {
//         blue.lighten(80%)
//       },
//     align: right,
//   )
  
//   #table(
//     columns: (6em, 4.5em, 3em, 2em, 5.4em, 5em, 6.5em, 6em),
//     inset: 7pt,
//     align: (left, center, center, center, center, center, center, center),
//     table.header(
//       [Language], [DSL Type], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], [Automatic Complete Alignment], 
//     ),
//     [*Proto*],[external],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
//     [*Protelis*],[external],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
//     [*ScaFi*],[internal],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],[*x*],
//     [*FCPP*],[internal c++],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],[*x*],
//   )
// ]

// #new-section-slide("What is Collektive?")

// #let collektive = box[
//   #table(inset: 1.5em, stroke: none, columns: (0.4fr, 1fr), align: (left, left),
//     [
//       #figure(
//        image("figures/collektive-logo.svg", width: 70%),
//       )
//     ]
//     , [
//       *Collektive* is a minimal DSL for aggregate programming in _Kotlin Multiplatform_, to simplify the development of distributed systems, providing high-level abstractions for collective coordination and communication.
//     ]
//   )
// ]

// #slide(title: "Collektive")[
//   #collektive
//   // TODO
// ]

// #slide(title: "Objective")[
//   #set table(
//     fill: (x, y) =>
//       if x == 0 or y == 0 {
//         blue.lighten(80%)
//       },
//     align: right,
//   )
//    #let check = table.cell(
//     fill: green.lighten(80%),
//   )[*\u{2713}*]
//   #let collektive = table.cell(
//     fill: green.lighten(80%),
//   )[*Collektive*]
//   #let kt = table.cell(
//     fill: green.lighten(80%),
//   )[internal kt]

//   #table(
//     columns: (6em, 4.5em, 3em, 2em, 5.4em, 5em, 6.5em, 6em),
//     inset: 7pt,
//     align: (left, center, center, center, center, center, center, center),
//     table.header(
//       [Language], [DSL Type], [JVM], [JS], [Wearable], [Reified Fields], [Transparent Alignment], [Automatic Complete Alignment], 
//     ),
//     [*Proto*],[external],[*x*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
//     [*Protelis*],[external],[*\u{2713}*],[*x*],[*x*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],
//     [*ScaFi*],[internal],[*\u{2713}*],[*\u{2713}*],[*\u{007E}*],[*x*],[*\u{007E}*],[*x*],
//     [*FCPP*],[internal c++],[*x*],[*x*],[*\u{007E}*],[*\u{2713}*],[*x*],[*x*],
//     collektive, kt, check, check, check, check, check, check, 
//     //[*Collektive*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[*\u{2713}*],[internal kt]
//   )
// ]


// #slide(title: "Alignment")[
//   In *Collektive* the alignment is managed by the *compiler plugin*, resulting in a trasparent, automatic and complete alignment.

//   // The control flow visits the functions, when it finds some that entails communication, the function gets pushed into a stack. Then the control flow exiting the function pops the name from the stack and generates a _path_.

//   // quando riusciamo a fare un allineamento trasparente non si riesce a farlo anche completo
//   // se scrivo del sw e il compilatore lo compila, se l'all è completo cioe per ogni chiamata a funzione lo devo allineare, l'unica è che tu chiami una funzione per dire di allineare
//   // scafi ha una chiamata apposita chiamata 'aggregate' 
  
//   // l'unico(?) modo per fare un allineamento completo automatico è passare da un plugin del compilatore kotlin (che lavori a compile time), quando incontra la condizione per cui si deve allineare mantiene un secondo genera un percorso su cui deve allineare in uno stack interno e quando c'è una chiamata a funzione che implica comunicazione viene registrato
//   // quindi becchiamo allineamento totale e trasparente
// ]

// #slide(title: "Heterogeneity")[
//   Different devices can have different sets of sensor and actuators.
//   Current approaches search for these capabilities at runtime.

//   We are working to capture them in the type system using Kotlin's *context functions*.

// ```kotlin
//   interface DistanceSensor { fun distances(): Field<Double> }

//   context(DistanceSensor) // capability required to run the program
//   fun Aggregate<Int>.gradient(source: Boolean): Double {
//       val dist = distances() // the capability is available locally
//       ...
//   }
//   ```
//   // i programmi aggregati assumono che ci sia lo stesso programma su i vari dispositivi altrimenti non allinea
//   // succede che ad un certo punto potremmo aver bisogno di leggere il valore di un sensore SE C'È, alcuni programmi non dovresti poterli chiamare (compilare) se una certa cosa non è disponi
//   // questa cosa non è banale da esprimere
//   // noi possiamo definire questa cosa utilizzando i context function di Kotlin, snippettino di codice con if se ho il sensore altrimenti, mentre collektive ha context() in cima 
// ]

// #let incarnation = box[
//   #table(inset: 0.1em, stroke: none, columns: (1fr, 1fr), align: (left, left),
//     [
//       #figure(
//        image("figures/gradient-2.png", width: 75%),
//       )
//     ]
//     , [
//       Simulating the behaviour of a distributed system is crucial to verify the correctness of the system and to understand its behaviour in different scenarios.
//     ]
//   )
// ]

// #slide(title: "Integration with Alchemist")[
//   #incarnation
// ]
// #new-section-slide("What's next?")

// #slide(title: "Ongoing")[
//   - Usable for experiments;
  
//   - Standard library next to be done;
  
//   - Actually working on an extension of an approach proposed at ACSOS.
// ]

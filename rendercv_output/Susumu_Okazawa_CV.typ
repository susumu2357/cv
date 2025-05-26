
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Susumu Okazawa"
#let locale-catalog-page-numbering-style = context { "Susumu Okazawa - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in May 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Susumu Okazawa

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Stockholm, Sweden],
  [#box(original-link("mailto:susumu.0112357@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)susumu.0112357\@gmail.com])],
  [#box(original-link("https://linkedin.com/in/susumu-okazawa-b954421b5")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)susumu-okazawa-b954421b5])],
)
#connections(connections-list)



== Experience


#two-col-entry(
  left-content: [
    #strong[Savantic AB], Senior Data Scientist
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Recommended as the most efficient developer that can deliver valuable machine learning solutions despite the short project duration],[Experienced with projects of all sizes and all ML phases],[Highly regarded not only for the coding skills, but also for the ability to prioritize tasks],)
  ],
  right-content: [
    Sweden

Aug 2020 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[TMI Associates], Patent Attorney
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Expanded business of patent prosecution by 200\% in the field of machine learning and quantum computer],[Presented patent strategy in the field of machine learning to pharmaceutical company and IT startups],[Supervised 3 junior attorneys],)
  ],
  right-content: [
    Japan

Oct 2016 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[HARUKA Patent & Trademark Attorneys], Patent Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Documented more than 100 patent specifications of software, semiconductor device, etc.],[Assisted clients with obtaining more than 100 patents in Japan, the US, Europe, China, and Korea],)
  ],
  right-content: [
    Japan

Apr 2013 – Oct 2016
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Japan Society for the Promotion of Science], Researcher

    
  ],
  right-content: [
    Japan

Apr 2012 – Mar 2013
  ],
)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[The Graduate University for Advanced Studies], Physics
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Thesis: Non-equilibrium aspects of the black hole thermodynamics],[Scholarships: Research Fellowship for Young Scientists],)
  ],
  right-content: [
    Japan

Apr 2008 – Mar 2013
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Tokyo Institute of Technology], Physics

    
  ],
  right-content: [
    Japan

Apr 2004 – Mar 2008
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] Python, OpenAI, Ollama, FastAPI, Transformers, PyTorch, Streamlit, Gradio, Apache Spark, Databricks, SQL, BigQuery, Kafka, Elasticsearch, Google Analytics, Power BI, Docker, Git, VS Code, Cursor, CI\/CD, MLOps, Agile, Scrum]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Cloud Platforms:] Microsoft Azure, Google Cloud, Amazon Web Services]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(fluent\), Japanese \(native\)]
)


== Certifications


#two-col-entry(
  left-content: [
    #strong[Certified ScrumMaster \(CSM\)]
  ],
  right-content: [
    June 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Science Professional]
  ],
  right-content: [
    June 2021
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Academy Accreditation - Delta Lake Essentials]
  ],
  right-content: [
    June 2021
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Japanese Patent Attorney]
  ],
  right-content: [
    Apr 2016
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Publications


#two-col-entry(
  left-content: [
    #strong[Workload assessment: Time to emanate from accurate conclusions instead of preconceived notions]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Dan Hasson, Susumu Okazawa, Karin Villaume

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1111/joop.12436")[10.1111/joop.12436]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Natural language processing as work support in project tendering]

  ],
  right-content: [
    2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Linda Cusumano, Rasmus Rempling, Robert Jockwer, Ricardo Alencar Saraiva, Mats Granath, Nilla Olsson, Susumu Okazawa

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1201/9781003348443-258")[10.1201/9781003348443-258]])



== Extracurricular Activities


#one-col-entry(
  content: [- A board member of Japanese School Association in Stockholm],
)


== Projects


#two-col-entry(
  left-content: [
    #strong[Fruit Quality Assessment System]
  ],
  right-content: [
    Sept 2024 – Feb 2025
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Led a team to develop hardware, GUI, and ML models for non-destructive fruit quality assessment.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Led a team to develop a hardware, a graphical user interface and machine learning models to estimate internal damage and ripeness of fruit without opening it],[Facilitated communication to achieve the fastest and the best quality of delivery],[Technologies used: Raspberry Pi, Hardware Development, Sensors, 3D printing, Python],[Methods used: IoT, Infrared spectroscopy, Agile, Scrum],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Document-based Chatbot]
  ],
  right-content: [
    Sept 2024 – Oct 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Led a team to develop a chatbot prototype that generates answers based on internal documents.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Led a team to develop a chatbot prototype that generates answer based on the internal document],[Mentoring new hires to get up and running as quickly as possible],[Created a CI\/CD pipeline to automate container deployment to Azure],[Technologies used: Azure OpenAI, Azure AI Search, Azure Document Intelligence, Azure App Service, Gradio, GitLab CI\/CD, Docker],[Methods used: Retrieval Augmented Generation \(RAG\), ChatGPT, Agile, Scrum, Code review],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[LLM-based Consultant Profile Generator]
  ],
  right-content: [
    Feb 2024 – Apr 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Supervised a master's thesis on generating consultant profiles using LLMs such as Mistral.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Supervised a master's thesis aiming at the generation of an on-demand consultant profile using Large Language Models \(LLMs\) such as Mistral],[Gave advice on open source vector databases and LLMs],[Supported setting up infrastructures such as Azure OpenAI and RunPod \(serverless GPU\)],[Technologies used: Azure OpenAI, ChatGPT, Qdrant, Large Language Models \(LLMs\), Mistral, Serverless GPU],[Methods used: Retrieval Augmented Generation \(RAG\), Prompt engineering],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Pipeline Modernization]
  ],
  right-content: [
    May 2023 – June 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed and modernized data pipelines using Azure Databricks and CI\/CD tools.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed several data pipelines using Azure Databricks with CI\/CD tools like Github Actions],[Introduced several modern features of Databricks such as Unity Catalog, Delta Live Tables and Databricks Asset Bundles],[Developed DAX code for Power BI to process the data for dashboarding],[Technologies used: Apache Spark, PySpark, SparkSQL, Databricks, Unity Catalog, Delta Live Tables, Databricks Asset Bundles, Github Actions, Power BI, DAX],[Methods used: Data modeling, CI\/CD, Agile, Scrum],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ChatGPT Document Generator]
  ],
  right-content: [
    Apr 2023 – May 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Built a proof of concept application using ChatGPT for document generation and vector database for PDF embeddings.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built a proof of concept application that uses ChatGPT to create a document specific to their field of expertise],[Built a vector database to store text embedding vectors extracted from PDF documents],[Developed the prompt for ChatGPT to include the relevant past document in the context],[Technologies used: NLP, ChatGPT, Qdrant, Streamlit, Docker, Microsoft Azure],[Methods used: Prompt engineering, Agile],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ChatGPT Workshop]
  ],
  right-content: [
    May 2023 – May 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Delivered a one-day workshop on using ChatGPT with vector search, including Python and F\# code samples.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Gave a one-day workshop for another consulting company on how to use ChatGPT with vector search],[Prepared sample code in both Python and F\# because the client mainly works on .NET],[Technologies used: ChatGPT, .NET, F\#],[Methods used: Workshop],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Streaming Data Processing Research]
  ],
  right-content: [
    Dec 2022 – Dec 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Explored streaming data processing using Apache Kafka for an internal hackathon.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Explored streaming data processing using Apache Kafka],[Prepared a stack of Confluent Kafka on an internal server for an internal hackathon],[Prepared an IoT device as a data source as well as a sample MQTT consumer],[Technologies used: Apache Kafka, MQTT, Docker-compose],[Methods used: IoT, Hackathon],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[LIA Internship Supervision]
  ],
  right-content: [
    Sept 2022 – Nov 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Supervised a LIA internship focused on practical machine learning and data analysis.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Supervised a LIA \(Lärande i Arbete\) internship who aims learning machine learning in practice],[Guided the interns on how to perform exploratory data analysis on the real data],[Provided advice on how to present findings to a broader audience],[Technologies used: pandas, scikit-learn, plotly],[Methods used: Exploratory data analysis, Code review],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Machine Translation API and ML Pipelines]
  ],
  right-content: [
    Sept 2022 – Apr 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed a machine translation API, ML pipelines, and a dashboard for ChatGPT testing.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a machine translation API, machine learning pipelines, and a dashboard for testing ChatGPT, which was an emerging technology],[Built the machine learning pipeline using Amazon SageMaker],[Built the translation API using FastAPI and Amazon Lambda],[Technologies used: FastAPI, AWS SageMaker, AWS Lambda, Amazon ECR, Docker],[Methods used: Machine translation, MLOps, Agile],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Mobile Device Location Estimation]
  ],
  right-content: [
    Nov 2021 – June 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed ML models and algorithms for mobile device location estimation and statistics aggregation.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed new machine learning models to estimate the location of mobile device based only on the ping time series],[Developed new gridding algorithms which are used in the aggregation of statistics],[Applied geospatial functions in BigQuery, taking care of the amount of data, which is a few hundred GB per day per country],[Technologies used: BigQuery, OpenStreetMap, GeoPandas, NumPy, Shapely, NumPyro, PyStan, Google Cloud, Docker],[Methods used: Exploratory data analysis, Geospatial analysis, Bayesian hierarchical model, Agile],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Physics Parameter Optimization]
  ],
  right-content: [
    Feb 2022 – Apr 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Supported strategy and used Optuna for optimal physics parameter search in fluid property models.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Supported a colleague in building the strategy and the customer relationship],[Suggested using Optuna to find the optimal physics parameters in the model which estimate the fluid properties flowing through pipe],[Technologies used: Optuna, scikit-learn, SciPy, NumPy, pandas],[Methods used: Exploratory data analysis, Hyper parameter tuning],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Travel Mode Detection Model]
  ],
  right-content: [
    Sept 2021 – May 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed a model to estimate public transport share and travel time ratios, with dashboard presentation.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed the travel mode detection model which can estimate the public transport share and the ratio of the travel time between the public transport and the private car],[Presented the results in a dashboard developed by Plotly Dash],[Technologies used: scikit-learn, SciPy, NumPy, pandas, Plotly, Dash, Docker],[Methods used: Exploratory data analysis, Data visualization],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Spare Parts Return Analysis]
  ],
  right-content: [
    Nov 2021 – Dec 2021
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Analyzed returns of spare parts and created SQL queries for data aggregation and visualization.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Analyzed returns of spare parts for all kinds of car and build a basis of further analysis],[Created SQL queries which aggregate data from a bunch of tables],[Visualized the results to grasp an overview of the returns],[Technologies used: Microsoft SQL Server, pandas, Plotly],[Methods used: Exploratory data analysis, Agile],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[GPT-2 Chatbot for Domestic Abuse Support]
  ],
  right-content: [
    Sept 2021 – Dec 2021
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Designed and trained a GPT-2 chatbot for domestic abuse support, deployed as a web API.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed the training data for a GPT-2 based chatbot which consults people suffering in domestic abuse],[Trained the GPT-2 based chatbot on a GPU in Azure],[Deployed the model in Azure Functions as a web API, which can be invoked from the mobile app],[Technologies used: pandas, GPT-2, Plotly, Streamlit, Docker, Microsoft Azure],[Methods used: NLP, Training on GPU, Agile],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Procurement Document Analysis Tools]
  ],
  right-content: [
    May 2021 – June 2021
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed text analysis and visualization tools for procurement documents, published a paper with the client.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed text analysis and visualization tools using Elasticsearch, Kibana, and Streamlit for procurement documents in PDF],[Deployed the applications as containerized web applications on Azure],[Published #link("https://research.chalmers.se/en/publication/534112")[a paper in proceeding] with the client],[Technologies used: Elasticsearch, Kibana, Streamlit, Docker, Docker-compose, Word2Vec, Plotly, Microsoft Azure],[Methods used: NLP, Agile],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[What-if Tool for Public Transport]
  ],
  right-content: [
    Mar 2021 – Apr 2021
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Built a prototype what-if tool for analyzing driver and target values, with Bayesian modeling.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built a prototype of a what-if tool which analyzes relationship between various driver values, such as punctuality, and target values, such as customer satisfaction index],[Developed the dashboard in one week, including the requested feature and two novel features],[Developed Bayesian hierarchical models to estimate relationship between the drivers and the targets for each user group],[Technologies used: NumPy, pandas, scikit-learn, NumPyro, GPy, Plotly, Dash, Voilà, Heroku],[Methods used: Exploratory data analysis, Data visualization, Bayesian hierarchical model],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Stress Management Data Analysis]
  ],
  right-content: [
    Jan 2021 – Feb 2021
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Analyzed stress management app data, identified personality clusters, and published a peer-reviewed paper.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Analyzed the questionnaire and stress-related time series data collected by a stress management application],[Identified clusters of personality traits that have strong confounding relationships with stress related variables],[Published #link("https://bpspsychub.onlinelibrary.wiley.com/doi/10.1111/joop.12436")[a peer reviewed paper] with the client],[Technologies used: NumPy, pandas, scikit-learn, tslearn, GPy, Matplotlib, Plotly],[Methods used: Statistical test, Time series analysis],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Customer Journey Analysis]
  ],
  right-content: [
    Nov 2020 – Dec 2020
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Analyzed customer journey factors using NLP and Bayesian models.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Analyzed the factors that influence the customer journey, for example, the number of calls, personal background, and content of text messages],[Used Natural Language Processing \(NLP\), which involves text classification, topic modelling, and feature extraction],[Gained insights from time series analysis using Bayesian probabilistic models],[Technologies used: Gensim, PyTorch, NumPyro, Matplotlib],[Methods used: NLP, Exploratory data analysis, Bayesian probabilistic model],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Swedish Question Answering System]
  ],
  right-content: [
    Oct 2020 – Nov 2020
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed a closed domain QA system based on BERT for English and Swedish, published dataset and model.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([developed a closed domain question answering system based on BERT in English and Swedish],[Published #link("https://huggingface.co/datasets/susumu2357/squad_v2_sv")[the Swedish SQuAD 2.0] dataset and #link("huggingface.co/susumu2357/bert-base-swedish-squad2")[the fine-tuned model]],[Established better scores on question answering task compared to the publicly available model],[Technologies used: Transformers, Google Cloud Translation, Tensorflow, PyTorch],[Methods used: Training on GPU],)
  ],
)




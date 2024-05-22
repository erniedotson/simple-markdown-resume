# Simple Markdown Resume

Simple Markdown Resume is a docker image for converting a resume in markdown format to Word (docx) or Acrobat (PDF) formats.

## ✅ System Requirements

- Docker
- make

## 🚀 Getting Started

1. Clone or download the repo
1. Build the docker image: `make image`
1. Modify [resume.md.sample](resume.md.sample) to `resume.md` and include your own content.
1. Use the docker image to convert your resume: `make resume`

##  😭 Motives

Writing resumes is the worst. You spend hours tailoring your resume for each position. You end up keeping a *main* or *long* resume with all the details, which you then prune down for each job position.

You end up with multiple different versions in Word or PDF format - formats which are necessary, but are difficult to compare different versions to each other and are binary and not well suited for version tracking.

When it comes to formatting, how many times have you noticed something in Word is just a little off and spent way longer than necessary fighting Word for what should a simple format or margin change? Starting from a blank document sucks, but every resume template that exists is somehow impossible to work with.

## 💪 Enter Markdown

Markdown is simple by design. It is *just text* and therefore easy to maintain, track in source control, and compare different versions.

It is possible to maintain that *main* or *long* version and with a few keystrokes in the editor simply comment our or remove lines which are not applicable for a particular application.

Markdown... ~~resume~~ everything-as-code... maintain in code editor... *yes, please!*

## 📄 Produce Word and PDF format

[Pandoc](https://pandoc.org/) is a document converter which works very well for converting Markdown to other format, like Word, PDF, and HTML, *(oh my!)*

There are many [pdf-engines](https://pandoc.org/MANUAL.html#option--pdf-engine) for Pandoc to assist in producing PDF documents. Most of these use HTML as an intermediary format, so they convert Markdown -> HTML -> PDF. [WeasyPrint](https://github.com/Kozea/WeasyPrint/) is a pdf-engine that produces nice looking PDF documents with lots of control using basic CSS layout.

[pandoc-ext/pagebreak](https://github.com/pandoc-ext/pagebreak) is a LUA script to add manual page breaks to pandoc output formats. To add a pagebreak add `\pagebreak` surrounded by two empty lines to your markdown, i.e.:

```markdown
before the break

\pagebreak

after the break
```

## 🎉 Tying it all together

Take Pandoc, WeasyPrint, and pandoc-ext/pagebreak and their dependencies and bundle them into a Docker image, to make it portable and minimize the host dependencies.

## 💄 Styles

The following styles are applied to HTML and PDF outputs via [style.css](src/style.css) and to docx via [style-reference.docx](src/style-reference.docx):

- Page margins at 0.25 inches.
- Black text on white background.
- Serif font for headings.
    - Cambria/Times New Roman/serif 18pt Bold for H1/Name.
    - Cambria/Times New Roman/serif 16pt Normal for H2/Section Headings (Skills, Experience, Education, etc.).
    - Cambria/Times New Roman/serif 14pt Normal for H3/Company Name.
    - Cambria/Times New Roman/serif 14pt Bold for H4/Job Title and years.
    - Cambria/Times New Roman/serif 12pt Normal for H5/2nd Job Title and years.
    - Cambria/Times New Roman/serif 10pt Normal for H6.
- Sans serif font for body text.
    - Calibri/Helvetica/sans-serif 10pt Bold for Location and Contact line (under/right of H1/Name).
    - Calibri/Helvetica/sans-serif 10pt Normal for body text.

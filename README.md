# Simple Markdown Resume

Simple Markdown Resume is a docker image for converting a resume in markdown format to Word (docx) or Acrobat (PDF) formats.

## ✅ System Requirements

- Docker
- make

## 🚀 Getting Started

1. Clone or download the repo
1. Build the docker image: `make image`
1. Modify [resume.sample.md](resume.sample.md) to `resume.md` and include your own content.
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

There are many [pdf-engines](https://pandoc.org/MANUAL.html#option--pdf-engine) for Pandoc to assist in producing PDF documents. Most of these use HTML as an intermediary format, so they convert Markdown -> HTML -> PDF.

[WeasyPrint](https://github.com/Kozea/WeasyPrint/) is a pdf-engine that produces nice looking PDF documents with lots of control using basic CSS layout.

## 🎉 Tying it all together

Take Pandoc, WeasyPrint and their dependencies and bundle them into a Docker image, to make it portable and minimize the host dependencies.

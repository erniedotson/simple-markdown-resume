#!/bin/bash
set -e

formats=( docx html pdf )

for format in "${formats[@]}"
do
    echo "$format"
    pandoc -s --embed-resources --standalone --strip-comments --pdf-engine=weasyprint -f markdown -t $format -i resume.md -o /output/resume.$format
done

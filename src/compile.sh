#!/bin/bash
set -e

formats=( docx html pdf )

for format in "${formats[@]}"
do
    echo "Converting to $format ..."

    if [[ "${format}" == "docx" ]]; then
        # Include reference-doc - necessary to style docx
        # Include lua filter for page breaks
        # Omit pdf-engine - not used for docx
        # Omit title parameters - optional (but unwanted) for docx
        # Omit css - not used for docx
        pandoc -s --embed-resources --standalone --strip-comments \
            --reference-doc style-reference.docx \
            --lua-filter=pagebreak.lua \
            -f markdown -t $format -i resume.md -o /output/resume.$format
    else
        # html and pdf have similar requirements, mainly because pdf requires html converstion first
        # Include pdf-engine - required for pdf, ignored for html
        # Include title parameters (but set empty) - title metadata required for html and pdf, but set unwanted title HTML element to empty
        # Include css - necessary to style html/pdf
        # Include lua filter for page breaks
        # Omit reference-doc - not used for html/pdf
        # Omit lua filter for page breaks
        pandoc -s --embed-resources --standalone --strip-comments \
            --pdf-engine=weasyprint \
            --metadata title='Resume' --variable=title='' \
            --css style.css \
            --lua-filter=pagebreak.lua \
            -f markdown -t $format -i resume.md -o /output/resume.$format
    fi
done

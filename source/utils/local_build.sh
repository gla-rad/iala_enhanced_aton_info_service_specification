#!/bin/bash
#
# To run this script you first need to install the pandoc executable into your
# system and include the pandoc-cross ref module. More information on that caN
# be found online:
# - https://pandoc.org/
# - https://github.com/lierdakil/pandoc-crossref
# 
# Then you can just run the following commands using this script:
#
# $ ./local_run.sh
#


# Get thge directory of the script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Move to the main directory
cd $SCRIPT_DIR/../..

# Create a Virtual Directory for Python
virtualenv .venv
source .venv/bin/activate

# And install all the necessary dependencies
ptyhon -m pip install --force-reinstall -U setuptools==81.0.0
python -m pip install python-docx==1.1.0
python -m pip install docxcompose==1.4.0
python -m pip install mermaid-cli
python -m playwright install chromium

# Generate the Mermaid Diagrams
for file in $(find . -name "*.md"); do
    mmdc -e png -b white -i $file -o $file
done

# Now run pandoc
pandoc --standalone\
            -f markdown+rebase_relative_paths+markdown_in_html_blocks\
            --lua-filter source/utils/parse_html_tables.lua\
            --lua-filter source/utils/page_break.lua\
            -F pandoc-crossref\
            --citeproc\
            --csl resources/ieee-with-url.csl\
            --bibliography source/bibliography/bibliography.bib\
            --reference-doc=resources/iala_guideline_template_body.docx\
            --output=output/body.docx\
            source/guideline/metadata.md\
            source/guideline/introduction.md\
            source/guideline/service_identification.md\
            source/guideline/operational_context.md\
            source/guideline/service_overview.md\
            source/guideline/service_data_model.md\
            source/guideline/dynamic_behaviour.md\
            source/guideline/references.md\
            source/guideline/acronyms_and_terms.md

# And finally combine the documents
python source/utils/combine_docx.py
# Makefile
#
# Converts constitution from Markdown format to any other format using Pandoc. Makefile modified from:
# https://gist.github.com/kristopherjohnson/7466917
#
# Run "make" (or "make all") to convert to all other formats
#
# Run "make clean" to delete converted files

# Convert all files in this directory that have a .md suffix
SOURCE_DOCS := $(filter-out README.md, $(wildcard *.md))

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.pdf) \
 $(SOURCE_DOCS:.md=.docx)

RM=/bin/rm

ifeq ($(OS),Windows_NT)
    PANDOC=/cygdrive/c/Program\ Files/Pandoc/pandoc.exe
else
    PANDOC=pandoc
endif

# Included date as command-line option workaround as per https://github.com/jgm/pandoc/issues/2865#issuecomment-257105573
PANDOC_OPTIONS=--standalone -M date="`date "+%B %e, %Y"`"

# PANDOC_HTML_OPTIONS=--to html5 --metadata-file $(basename $@)_metadata.yml
PANDOC_PDF_OPTIONS=--to latex --metadata-file metadata/$(basename $@).yml --template .pandoc-build/latex_template.tex -M fontsize="12pt"
PANDOC_DOCX_OPTIONS=--to docx --metadata-file metadata/$(basename $@).yml --reference-doc .pandoc-build/word_referencedoc.docx

# Pattern-matching Rules

# %.html : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $@ $<

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<
	
%.docx : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $@ $<


# Targets and dependencies

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
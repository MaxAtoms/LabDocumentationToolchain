SOURCE_DOCS := $(wildcard *.md)
SOURCE_DOCS := $(filter-out README.md, $(SOURCE_DOCS))
EXPORTED_DOCS = $(SOURCE_DOCS:.md=.pdf)

RM=/bin/rm

PANDOC=/usr/bin/pandoc
PANDOC_OPTIONS=
PANDOC_PDF_OPTIONS=metadata.yaml --metadata date="`date +%F`" --from markdown --template eisvogel --listings

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
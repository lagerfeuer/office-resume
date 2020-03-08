LATEX := latexmk
OUTDIR := out/
FLAGS := -pdf -outdir=$(OUTDIR)
PDFS := $(subst tex,pdf,$(shell find . -name "*.tex"))

ifeq ($(cont), true)
  FLAGS += -pvc
endif


all: build

build: $(PDFS)

resume: resume.pdf

cover-letter: coverletter.pdf

cover-letters: coverletters/*.pdf

%.pdf: %.tex
	$(LATEX) $(FLAGS) $<

clean:
	rm -rf $(shell find $(OUTDIR) -type f -not -name "*.pdf")

cleanall:
	rm -rf $(OUTDIR)

.PHONY: build example resume cover-letter clean cleanall

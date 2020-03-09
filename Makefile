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
	$(LATEX) $(FLAGS) -c

cleanall:
	$(LATEX) $(FLAGS) -C

.PHONY: build example resume cover-letter clean cleanall

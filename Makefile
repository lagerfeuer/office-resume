LATEX := latexmk
OUTDIR := out/
FLAGS := -pdf -outdir=$(OUT)
PDFS := $(subst tex,pdf,$(shell find . -name "*.tex"))

ifeq ($(cont), true)
  FLAGS += -pvc
endif


all: build

build: $(PDFS)

resume: resume.pdf

cover-letter: cover_letter.pdf

cover-letters: cover-letters/*.pdf

%.pdf: %.tex
	$(LATEX) $(FLAGS) $<

clean:
	rm -rf $(shell find $(OUT) -type f -not -name "*.pdf")

cleanall:
	rm -rf $(OUT)

.PHONY: build example resume cover-letter clean cleanall

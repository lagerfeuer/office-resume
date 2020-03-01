LATEXMK := latexmk
FLAGS := -pdf
OUT += -outdir=out/
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
	$(LATEXMK) $(FLAGS) $(OUT) $<

clean:
	rm -rf $(shell find out/ -type f -not -name "*.pdf")

cleanx:
	rm -rf out/

.PHONY: build example resume cover-letter clean cleanx

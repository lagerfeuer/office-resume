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

coverletter: coverletter.pdf

coverletters: coverletters/*.pdf

%.pdf: %.tex
	$(LATEX) $(FLAGS) $<

clean:
	$(LATEX) $(FLAGS) -c

cleanall:
	$(LATEX) $(FLAGS) -C

.PHONY: build example resume coverletter coverletters clean cleanall

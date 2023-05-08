LATEX = xelatex
LATEXFLAGS = -halt-on-error

SHOW = zathura
SHOWFLAGS =

SRC = target.tex
TARGET = target

all: $(TARGET_PDF)

$(TARGET).pdf: $(SRC)
	$(LATEX) $(LATEXFLAGS) -jobname="$(TARGET)" $(SRC)

show: $(TARGET).pdf
	$(SHOW) $(TARGET).pdf

.PHONY: clean

clean:
	rm -rf $(TARGET).pdf $(TARGET).aux $(TARGET).log $(TARGET).out $(TARGET).snm $(TARGET).nav $(TARGET).toc

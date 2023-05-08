LATEX 		:= xelatex
LATEXFLAGS 	:= -halt-on-error

SHOW 		:= zathura
SHOWFLAGS 	:=

SRC 		:= target.tex
TARGET 		:= target

all: $(TARGET).pdf

$(TARGET).pdf: $(SRC)
	$(LATEX) $(LATEXFLAGS) -jobname="$(TARGET)" $(SRC)

show: $(TARGET).pdf
	$(SHOW) $(SHOWFLAGS) $(TARGET).pdf

.PHONY: clean

clean:
	rm -rf $(TARGET).pdf $(TARGET).aux $(TARGET).log $(TARGET).out $(TARGET).snm $(TARGET).nav $(TARGET).toc

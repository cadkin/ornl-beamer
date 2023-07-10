BUILD_DIR	:= build

LATEX 		:= xelatex
LATEXFLAGS 	:= -halt-on-error -output-directory=$(BUILD_DIR)

SHOW 		:= zathura
SHOWFLAGS 	:=

SRC 		:= target.tex
TARGET 		:= target

all: $(BUILD_DIR)/$(TARGET).pdf

$(BUILD_DIR)/$(TARGET).pdf: $(SRC)
	mkdir -p $(BUILD_DIR)
	$(LATEX) $(LATEXFLAGS) -jobname="$(TARGET)" $(SRC)

show: $(BUILD_DIR)/$(TARGET).pdf
	$(SHOW) $(SHOWFLAGS) $(BUILD_DIR)/$(TARGET).pdf

.PHONY: clean

clean:
	rm -rf $(BUILD_DIR)

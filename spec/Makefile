BIN = ../node_modules/.bin
SRC = $(wildcard *.coffee)
LIB = $(SRC:%.coffee=%.js)

build: bundle.js

%.js: %.coffee
	@$(BIN)/coffee -bcp $< > $@

bundle.js: $(LIB)
	$(BIN)/browserify index.js > $@

clean:
	rm -f bundle.js $(LIB)

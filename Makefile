all: UnicodeData.txt map

UnicodeData.txt:
	wget http://www.unicode.org/Public/UNIDATA/UnicodeData.txt

map: pgreek.hs UnicodeData.txt
	[ -d keymap ] || mkdir keymap
	runhaskell pgreek.hs

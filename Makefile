all: output/select.sql.with-syntax-highlighting.tesseract.txt                           \
	   output/select.sql.with-syntax-highlighting.tesseract-preserve_interword_spaces.txt \
	   output/select.sql.with-syntax-highlighting.tesseract-tessedit_create_hocr.hocr     \
		 output/select.sql.with-syntax-highlighting.ocread.pbm.txt

output/select.sql.with-syntax-highlighting.tesseract.txt:                           input/select.sql.with-syntax-highlighting.png
	tesseract                                input/select.sql.with-syntax-highlighting.png output/select.sql.with-syntax-highlighting.tesseract

output/select.sql.with-syntax-highlighting.tesseract-preserve_interword_spaces.txt: input/select.sql.with-syntax-highlighting.png
	tesseract -c preserve_interword_spaces=1 input/select.sql.with-syntax-highlighting.png output/select.sql.with-syntax-highlighting.tesseract-preserve_interword_spaces

output/select.sql.with-syntax-highlighting.tesseract-tessedit_create_hocr.hocr:      input/select.sql.with-syntax-highlighting.png
	tesseract -c tessedit_create_hocr=1      input/select.sql.with-syntax-highlighting.png output/select.sql.with-syntax-highlighting.tesseract-tessedit_create_hocr

output/select.sql.with-syntax-highlighting.ocread.pbm.txt:                           converted-images/select.sql.with-syntax-highlighting.pbm
	ocrad input/select.sql.with-syntax-highlighting.pbm > output/select.sql.with-syntax-highlighting.ocread.pbm.txt

converted-images/select.sql.with-syntax-highlighting.pbm:                            input/select.sql.with-syntax-highlighting.png
	convert input/select.sql.with-syntax-highlighting.png -format pbm converted-images//select.sql.with-syntax-highlighting.pbm


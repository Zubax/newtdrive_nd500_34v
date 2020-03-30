mkdir out
pdflatex --halt-on-error --shell-escape -output-directory=out ../Zubax_Sadulli.tex
pdflatex --halt-on-error --shell-escape -output-directory=out ../Zubax_Sadulli.tex
pdflatex --halt-on-error --shell-escape -output-directory=out ../Zubax_Sadulli.tex
cp .\out\Zubax_Sadulli.pdf Zubax_Sadulli.pdf
rmdir out -Recurse

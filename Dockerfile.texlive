FROM alpine

MAINTAINER Dmitry Ustalov <dmitry.ustalov@gmail.com>

COPY ["PT Public Pack_OtTt.zip", "/usr/share/fonts/"]

RUN \
cd /usr/share/fonts && \
unzip 'PT Public Pack_OtTt.zip' && \
rm -v *.zip && \
apk add --no-cache texlive-full biber make && \
ln -sf /usr/share/texmf-dist/fonts /usr/share/fonts && \
fc-cache -fv && \
ln -sf /usr/bin/luatex /usr/bin/lualatex && \
TEMP=$(mktemp -d) && \
echo '\documentclass{article}' > $TEMP/stub.tex && \
echo '\title{Lorem ipsum}' >> $TEMP/stub.tex && \
echo '\author{John Doe}' >> $TEMP/stub.tex && \
echo '\begin{document}' >> $TEMP/stub.tex && \
echo '\maketitle' >> $TEMP/stub.tex && \
echo '\end{document}' >> $TEMP/stub.tex && \
cd $TEMP && \
latexmk -silent stub && \
latexmk -lualatex -silent stub && \
rm -rf $TEMP

CC = gcc
CFLAGS = -Wall

all: analyzer

analyzer: log_analyzer.tab.c lex.yy.c data.c
	$(CC) $(CFLAGS) -o analyzer log_analyzer.tab.c lex.yy.c data.c

log_analyzer.tab.c: log_analyzer.y data.h
	bison -d log_analyzer.y

lex.yy.c: log_analyzer.l log_analyzer.tab.h
	flex log_analyzer.l

clean:
	rm -f analyzer log_analyzer.tab.c log_analyzer.tab.h lex.yy.c 
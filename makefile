IDIR=-I/usr/local/include/gtest -I/usr/include
CC=g++
CFLAGS=$(IDIR)

ODIR=obj
#LDIR =../lib

LIBS=-lfolly -lgtest -lglog -lpthread -ldl -ldouble-conversion -lboost_regex -levent -liberty -lboost_context

_DEPS=
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ=follyFuture.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

follyFuture: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 

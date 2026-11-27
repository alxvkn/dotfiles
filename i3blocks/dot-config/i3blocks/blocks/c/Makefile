LDFLAGS = -Wl,-s
CFLAGS = -Os

BIN = storage ram

all: $(BIN) tidy

ram: ram.o

storage: storage.o

tidy:
	$(RM) *.o

clean:
	$(RM) *.o $(BIN)

.PHONY: clean tidy

CFLAGS=-O3 -g -I/usr/include/sodium -DNDEBUG
objs=elligator.o vxeddsa.o xeddsa.o keygen.o zeroize.o curve_sigs.o \
	fe_isequal.o fe_mont_rhs.o fe_montx_to_edy.o ge_montx_to_p3.o \
	ge_p3_to_montx.o ge_scalarmult.o ge_scalarmult_cofactor.o \
	sc_clamp.o sc_cmov.o sc_neg.o fe_sqrt.o sign_modified.o \
	open_modified.o vsign_modified.o compare.o vopen_modified.o \
	ge_neg.o ge_isneutral.o

libs=/usr/lib/libsodium.a

all: test.elf

test.elf: $(objs)
	$(CC) $(CFLAGS) -o test.elf tests.c $(objs) $(libs)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm *.o *.elf || return 0

.PHONY: clean

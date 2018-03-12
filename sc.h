#ifndef SC_H
#define SC_H
#include <../sodium/version.h>

/*
The set of scalars is \Z/l
where l = 2^252 + 27742317777372353535851937790883648493.
*/

#if SODIUM_LIBRARY_VERSION_MAJOR > 9
#define sc_reduce                     sc25519_reduce
#define sc_muladd                     sc25519_muladd
#else
#define sc_reduce crypto_core_curve25519_ref10_sc_reduce
#define sc_muladd crypto_core_curve25519_ref10_sc_muladd
#endif // SODIUM_LIBRARY_VERSION_MAJOR > 9

extern void sc_reduce(unsigned char *);
extern void sc_muladd(unsigned char *,const unsigned char *,const unsigned char *,const unsigned char *);

#endif

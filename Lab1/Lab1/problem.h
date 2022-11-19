#ifndef LISTA_H
#define LISTA_H


//tip de data generic (pentru moment este intreg)
typedef int TElem;

//referire a structurii Nod;
struct Nod;

//se defineste tipul PNod ca fiind adresa unui Nod
typedef Nod* PNod;

typedef struct Nod {
	TElem e;
	PNod urm;
};

typedef struct {
	//prim este adresa primului Nod din lista
	PNod _prim;
} Lista;

//operatii pe lista - INTERFATA

//crearea unei liste din valori citite pana la 0
Lista creareA();
Lista creareB();
Lista creareC();

int testInclusion(Lista A, Lista B, PNod a, PNod b, int number);

bool resolveInclusion(Lista a, Lista b);

PNod removeElem(int x, PNod head);

void tipar(Lista a, Lista b);

void tipar_rec(PNod p);
// destructorul listei
void distrug(Lista l);

#endif

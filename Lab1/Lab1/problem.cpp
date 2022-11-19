#include "problem.h"
#include <iostream>

using namespace std;


PNod creare_rec(int i,TElem v[]) {

    if (v[i] == 0)
        return NULL;
    else {
        PNod p = new Nod();
        p->e = v[i];
        p->urm = creare_rec(i+1,v);
        return p;
    }
}

Lista creareA() {
    TElem v[] = { 1,2,3,4,4,3,0 };

    Lista a;
    a._prim = creare_rec(0,v);

    return a;
    
}

Lista creareB() {
    TElem v[] = { 2,4,3,1,0 };

    Lista b;
    b._prim = creare_rec(0,v);

    return b;
}

Lista creareC() {
    TElem v[] = { 2,2,0 };

    Lista b;
    b._prim = creare_rec(0, v);

    return b;
}

int sizeOfList(PNod a)
{
    if (a != NULL)
    {
        return 1 + sizeOfList(a->urm);
    }
    else
    {
        return 0;
    }
}

int testInclusion(Lista A,  Lista B,PNod a, PNod b,int number)
{
    if (a != NULL && b!=NULL)
    {
        if (a->e == b->e)
        {
            return 1+testInclusion(A,B,a->urm, B._prim, number++);
        }
        else
        {
            return 0+testInclusion(A,B, a, b->urm, number);
        }
    }
}

bool resolveInclusion(Lista a, Lista b)
{
    int number = 0,nr1 = sizeOfList(a._prim);
    int nr2 = testInclusion(a,b,a._prim, b._prim, number);

        if (nr1+1 == nr2)
            return true;
        return false;
}

void tipar(Lista a,Lista b) {
    cout << resolveInclusion(a, b);
}


PNod removeElem(int x, PNod head) {
    if (head == NULL)
        return head;
    if (head->e == x) {
        PNod node = head;
        head = head->urm;
        free(node);
        return removeElem(x, head);
    }
    head->urm = removeElem(x, head->urm);
    return head;
}


void tipar_rec(PNod p) {
    if (p != NULL) {
        cout << p->e << " ";
        tipar_rec(p->urm);
    }
}
void distrug_rec(PNod p) {
    if (p != NULL) {
        distrug_rec(p->urm);
        delete p;
    }
}

void distrug(Lista l) {
    //se elibereaza memoria alocata nodurilor listei
    distrug_rec(l._prim);
}


#include "numero.h"

Numero::Numero(int num, int qtd, int stdd) : numero(num), saidas(qtd), desvio(stdd)
{
}

Numero::Numero(const Numero &other) : numero(other.numero), saidas(other.saidas), desvio(other.desvio)
{
}

Numero &Numero::operator=(const Numero &other)
{
  numero = other.numero;
  saidas = other.saidas;
  desvio = other.desvio;
  return *this;
}

bool greaterThenDesvio(const Numero &n1, const Numero &n2)
{
  return n1.desvio > n2.desvio;
}

void qSwap(Numero &n1, Numero &n2) {
  Numero tmp(n1);
  n1= n2;
  n2 = tmp;
}

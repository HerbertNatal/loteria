#include "mesmadezena.h"

MesmaDezena::MesmaDezena(const int &valorMaximo) : qtdMaxima(valorMaximo)
{
}

MesmaDezena::~MesmaDezena()
{
}

bool MesmaDezena::serve(const Jogo &j)
{
	register int *de = d+6;
  for(register int *i = d; i < de; i++) {
    *i = 0;
  }
  register Jogo::const_iterator e = j.end();
  for(register Jogo::const_iterator i = j.begin(); i != e; i++) {
    register int v = (*i) - 1;
    d[ v/10 ]++;
  }
  for(register int *i = d; i < de; i++) {
    if(*i >= qtdMaxima )
      return false;
  }
  return true;
}

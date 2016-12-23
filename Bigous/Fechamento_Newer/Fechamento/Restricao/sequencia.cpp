#include "sequencia.h"

Sequencia::Sequencia(const int &valorMaximo) : qtdMaxima(valorMaximo)
{
}

Sequencia::~Sequencia()
{
}

bool Sequencia::serve(const Jogo &j)
{
  register int qtd=0;
  register Jogo::const_iterator c = j.begin();
  register Jogo::const_iterator e = j.end();
  register int av = *c;
  for(c++; c != e; c++) {
    register const int &v = *c;
    if(av + 1 == v) {
      qtd++;
      if(qtd >= qtdMaxima)
        return false;
    } else {
      qtd = 0;
    }
    av = v;
  }
  return true;
}

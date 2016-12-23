#include "maiordesviotransformacao.h"

MaiorDesvioTransformacao::MaiorDesvioTransformacao(Base *p_historico) : ITransformacao(p_historico)
{
  transf.reserve(p_historico->size());
  foreach(const Numero &n, *p_historico) {
    transf.push_back(n);
  }
  Numeros::iterator i = transf.begin();
  Numeros::iterator e = transf.end();
  qSort(i, e, greaterThenDesvio);
}

MaiorDesvioTransformacao::~MaiorDesvioTransformacao()
{
}

void MaiorDesvioTransformacao::transformar(Jogo &j)
{
  register Jogo::iterator e = j.end();
  for(register Jogo::iterator i = j.begin(); i != e; i++) {
    *i = transf[(*i) - 1].numero;
  }
  j.resort();
}

int MaiorDesvioTransformacao::getIndex(const int &num)
{
    Numeros::const_iterator ie = transf.end();
    int ret = 1;
    for(Numeros::const_iterator ib = transf.begin(); ib != ie; ib++, ret++) {
        if(num == (*ib).numero)
            return ret;
    }
    return -1;
}

#pragma once

#include <Restricao/irestricao.h>
#include <Transformacao/itransformacao.h>

class NPrimeirosNumeros : public IRestricao
{
  int n;
  ITransformacao *transf;
public:
  NPrimeirosNumeros(const int &pn, ITransformacao *ptransf);
  virtual ~NPrimeirosNumeros();

  virtual bool serve(const Jogo &j);
};


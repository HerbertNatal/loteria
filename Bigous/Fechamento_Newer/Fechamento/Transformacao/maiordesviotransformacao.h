#pragma once

#include <Transformacao/itransformacao.h>

class MaiorDesvioTransformacao : public ITransformacao
{
  Numeros transf;
public:
  explicit MaiorDesvioTransformacao(Base *p_historico=NULL);
  virtual ~MaiorDesvioTransformacao();

  virtual void transformar(Jogo &j);
  virtual int getIndex(const int &num);
};

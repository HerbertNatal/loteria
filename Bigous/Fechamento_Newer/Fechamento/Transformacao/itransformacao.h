#pragma once

#include <base.h>
#include <jogo.h>

class ITransformacao
{
public:
  typedef QList<Jogo> MapJogos;

private:
  Base *historico;
  MapJogos jogos;

public:

  explicit ITransformacao(Base *p_historico=NULL);
  virtual ~ITransformacao();

  virtual void transformar(Jogo &j) = 0;
  virtual int getIndex(const int &num) = 0;
  virtual void armazenar(const Jogo &j);
  inline MapJogos &getJogos() { return jogos; }
};


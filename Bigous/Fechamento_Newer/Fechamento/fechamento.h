#pragma once

#include <QtCore>
#include <combinatoria.h>
#include <Restricao/irestricao.h>
#include <Transformacao/itransformacao.h>

class Fechamento : public Combinatoria
{
  QList< IRestricao * > restricoes;
  QList< ITransformacao * > transformacoes;

public:
  explicit Fechamento(const int &p_fecha=4, const int &p_from = 60, const int &p_choose = 6);
  virtual ~Fechamento();

  inline void addRestricao(IRestricao *res) { restricoes.push_back(res); }
  inline void addTransformacao(ITransformacao *trans) { transformacoes.push_back(trans); }

  virtual void run();
protected:
  virtual void processar(int *comb, const int &size);

  bool validar(const Jogo &j) const;

};



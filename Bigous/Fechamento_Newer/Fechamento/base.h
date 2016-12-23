#pragma once

#include <QtCore>
#include <jogo.h>
#include <numero.h>

class Base : public Numeros {
  Jogos sorteios;
public:

  int mediaSaidas;

  bool loadFromFile(const QString &fileName);

  inline bool jaFoi(const Jogo &j) {
    return sorteios.find(j) != sorteios.end();
  }

protected:
  void calculateMediaSaidas();
  void calculateDesvio();
};


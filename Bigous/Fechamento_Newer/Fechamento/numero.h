#pragma once

#include <QtCore>

class Numero {
public:
  int numero;
  int saidas;
  int desvio;

  explicit Numero(int num=0, int qtd=0, int stdd=0);
  explicit Numero(const Numero &other);

  inline bool operator==(const Numero &other) {
    return numero == other.numero;
  }
  inline bool operator==(const int &other) {
    return other == numero;
  }

  Numero &operator=(const Numero &other);
};

bool greaterThenDesvio(const Numero &n1, const Numero &n2);

void qSwap(Numero &n1, Numero &n2);

typedef QVector<Numero> Numeros;

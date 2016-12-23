#pragma once

#include <QtCore>

class Jogo
{
  int *numeros;
  bool alocated;
public:
  Jogo();
  explicit Jogo(int *nums, const bool &p_copy=false);
  explicit Jogo(const Jogo &other, const bool &p_copy=true);
  virtual ~Jogo();

  typedef int* iterator;
  typedef const int* const_iterator;

  inline iterator begin() { return numeros; }
  inline iterator end() { return numeros+6; }
  inline const_iterator begin() const { return numeros; }
  inline const_iterator end() const { return numeros+6; }

  inline const int *asIntArray() const { return numeros; }

  bool operator==(const Jogo &other) const;
  bool operator<(const Jogo &other) const;
  inline int &operator[](const int &index) { return numeros[index]; }

  void copy(int *nums);

  int qtdMatch(const Jogo &other) const;
  void resort();
  long long toLongLong() const;

	void writeTo(QTextStream &ts) const;

};

uint qHash(const Jogo &j);

typedef QSet<Jogo> Jogos;


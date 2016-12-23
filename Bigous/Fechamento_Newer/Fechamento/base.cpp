#include "base.h"

bool Base::loadFromFile(const QString &fileName) {
  clear();
  sorteios.clear();
  reserve(60);
  sorteios.reserve(2000);

  for(int i = 1; i <= 60; i++)
  {
    push_back(Numero(i));
  }
  QFile f(fileName);
  if(!f.open(QIODevice::ReadOnly))
    return false;
  QTextStream ts(&f);
  ts.setCodec(QTextCodec::codecForLocale());

  while(!ts.atEnd()){
    QStringList numeros = ts.readLine().split(';');
    Jogo j;
    register int i = 0;
    foreach(const QString &snum, numeros) {
      int num = snum.toInt();
      (*this)[(num-1)].saidas++;
      j[i++] = num;
    }
    j.resort();
    sorteios.insert(j);
  }

  calculateMediaSaidas();

  calculateDesvio();

  return true;
}

void Base::calculateMediaSaidas() {
  mediaSaidas = 0;
  foreach(const Numero &num, *this) {
    mediaSaidas += num.saidas;
  }
  mediaSaidas /= size();
}

void Base::calculateDesvio() {
  foreach(const Numero &cnum, *this) {
    Numero *num = const_cast<Numero*>(&cnum);
    num->desvio = qAbs(cnum.saidas - mediaSaidas);
  }
}

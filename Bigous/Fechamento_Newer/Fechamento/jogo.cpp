#include "jogo.h"

Jogo::Jogo() : alocated(true)
{
  numeros = new int[6];
  register iterator e = end();
  for(register iterator i = begin(); i != e; i++)
    *i = 0;
}

Jogo::Jogo(int *nums, const bool &p_copy) : numeros(nums), alocated(p_copy)
{
  if(alocated) {
    numeros = new int[6];
    copy(nums);
  }
}

Jogo::Jogo(const Jogo &other, const bool &p_copy) : numeros(other.numeros), alocated(p_copy)
{
  if(alocated) {
    numeros = new int[6];
    copy(other.numeros);
  }
}

Jogo::~Jogo()
{
  if(alocated) {
    delete [] numeros;
  }
}

bool Jogo::operator==(const Jogo &other) const
{
  register const_iterator i = begin();
  register const_iterator o = other.begin();
  register const_iterator e = end();
  for(; i != e; i++, o++) {
    if(*i != *o)
      return false;
  }
  return true;
}

bool Jogo::operator<(const Jogo &other) const
{
  register const_iterator i1 = begin(), i2 = other.begin();
  register const_iterator ie = end(), oe = other.end();
  while(i1 != ie && i2 != oe) {
    if((*i1) < (*i2))
      return true;
    else if((*i1) > (*i2))
      return false;
  }
  return i2 != oe;
}

void Jogo::copy(int *nums)
{
  if(!alocated) {
    alocated = true;
    numeros = new int[6];
  }
  register iterator e = end();
  register int *o = nums;
  for(register iterator i = begin(); i != e; i++, o++) {
    *i = *o;
  }
  resort();
}

int Jogo::qtdMatch(const Jogo &other) const
{
  register const_iterator i1 = begin(), i2 = other.begin();
  register const_iterator e1 = end(), e2 = other.end();
  register int ret = 0;
  for(;i1 != e1 && i2 != e2;) {
    if(*i1 == *i2) {
      ret++;
      i1++;
      i2++;
    } else if(*i1 > *i2) {
      i2++;
    } else {
      i1++;
    }
  }
  return ret;
}

void Jogo::resort()
{
  qSort(begin(),end());
}

long long Jogo::toLongLong() const
{
  long long ret = 0;
  register const_iterator e = end();
  for(register const_iterator i = begin(); i != e; i++) {
    ret += *i;
    ret <<= 8;
  }
  return ret;
}

void Jogo::writeTo(QTextStream &ts) const
{
	register const_iterator i = begin(), e = end();
	for(; i != e; i++) {
		ts << ';' << *i;
	}
}

uint qHash(const Jogo &j)
{
  const int *c = j.asIntArray();
  uint ret = (c[0]-1)*60*60*60*60 + (c[1]-1)*60*60*60 + (c[2]-1)*60*60 + (c[3]-1)*60 + (c[4]-1);
  ret += (c[5]-1) + 60*60*60*60*60;
  return ret;
}

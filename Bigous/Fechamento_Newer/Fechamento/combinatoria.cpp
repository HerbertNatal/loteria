#include "combinatoria.h"

void Combinatoria::calculateTotal()
{
  total = 1.0;
  double end = double(from - choose);
  for(register double i = double(from); i > end; i-=1.0) {
    total *= i;
  }
  double divisor = 1.0;
  end = double(choose);
  for(register double i = 2.0; i <= end; i++)
    divisor *= i;
  total /= divisor;
}

Combinatoria::Combinatoria(int p_from, int p_choose) : from(p_from), choose(p_choose), stop(false)
{
  calculateTotal();
}

Combinatoria::~Combinatoria()
{
}

void Combinatoria::run()
{
  running = true;
  stop = false;
  position = 0.0;
  int i, j=1, x;
  int *c = new int[choose+3];
  int *copia = c+1;

  // inicia combinacao
  for (i=1; i <= choose; i++) {
    c[i] = i;
  }
  c[choose+1] = from+1;
  c[choose+2] = 0;
  j = choose;

  for(;!stop;) {
    position += 1.0;
    processar(copia, choose);

    if (j > 0)
    {
      x = j+1;
    } else {

      if (c[1] + 1 < c[2])
      {
        c[1] += 1;
        continue;
      }

      j = 2;

      for(;;) {
        c[j-1] = j-1;
        x = c[j] + 1;
        if (x == c[j+1])
        {
          j++;
        } else {
          break;
        }
      }

      if (j > choose)
        break;

    }
    c[j] = x;
    j--;
  }
  delete [] c;
  stop = false;
  running = false;
}

bool Combinatoria::setFrom(const int &value)
{
  if(!running) {
    from = value;
    calculateTotal();
    return true;
  }
  return false;
}

bool Combinatoria::setChoose(const int &value)
{
  if(!running) {
    choose = value;
    calculateTotal();
    return true;
  }
  return false;
}

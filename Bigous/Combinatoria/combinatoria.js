'use strict';

function combinatoria(from, choose, callback)
{
  var i, j=1, x;
  var c = new Array(choose + 3);

  // inicia combinacao
  for (i=1; i <= choose; i++) {
    c[i] = i;
  }
  c[choose+1] = from+1;
  c[choose+2] = 0;
  j = choose;

  for(;;) {
    callback(c,choose);

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
}

function combinacoes(from, choose, callback) {
	combinatoria(from, choose, function(c, choose) {
		callback(c.slice(1,choose+1));
	});
}

module.exports = combinacoes;
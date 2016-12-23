#pragma once

class Combinatoria
{
  int from;
  int choose;
  double position;
  double total;
  bool stop;
  bool running;

  void calculateTotal();
public:
  explicit Combinatoria(int p_from=60, int choose=6);
  virtual ~Combinatoria();

  virtual void run();

  inline const int getFrom() const { return from; }
  inline const int getChoose() const { return choose; }
  inline const double &getPosition() const { return position; }
  inline const double &getTotal() const { return total; }
  inline const bool &getStop() const { return stop; }
  inline const bool &isRunning() const { return running; }
  inline bool isStopping() const { return running == true && stop == true; }

  bool setFrom(const int &value);
  bool setChoose(const int &value);
  inline void Stop(const bool &value) { stop = value; }

  virtual void processar(int *comb, const int &size) = 0;

};


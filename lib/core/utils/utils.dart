class Utils {
  static reMap(double x,
      {required double inMin,
      required double inMax,
      required double outMin,
      required double outMax}) {
    return (((outMax - outMin) * (x - inMin)) / (inMax - inMin)) + outMin;
  }
}

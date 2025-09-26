package br.com.nemeia.brigia.utils;

import java.math.BigDecimal;

public class BigDecimals {
  public static boolean lt(BigDecimal a, BigDecimal b) {
    return a.compareTo(b) < 0;
  }
  public static boolean lte(BigDecimal a, BigDecimal b) {
    return a.compareTo(b) <= 0;
  }
  public static boolean gt(BigDecimal a, BigDecimal b) {
    return a.compareTo(b) > 0;
  }
  public static boolean gte(BigDecimal a, BigDecimal b) {
    return a.compareTo(b) >= 0;
  }
  public static boolean eq(BigDecimal a, BigDecimal b) {
    return a.compareTo(b) == 0;
  }
}
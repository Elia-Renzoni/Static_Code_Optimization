/*
 *
 *   @authors Elia Renzoni - Alessio Visentino - Alessio Biagioli
 *   @date 29/04/2023
 *   @brief implementazione RKM - Progetto Architettura degli Elaboratori
 *   @copyright Copyright (c) 2023
 *
 * */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void rabin_karp_matcher(char testo[], char pattern[], int, int);

int main(void) {

  char testo[] = "pantaloni   gabellini     230 felpa       sartori       40scarpe      giovannini    56pantaloni   gabellini     120felpa       giovannini    34calze       falcioni      90pantaloni   papalini      32felpa       sabatinelli   67felpa       giacomini     90scarpe      gabellini     123scarpe      sabatinelli   46pantaloni   giacomini     90pantaloni   terenzi       12calze       frantoni      321";
  char pattern[] = "gabellini";
  int  lunghezza_testo = strlen(testo);
  int  numero_elementi = strlen(pattern);

  rabin_karp_matcher(testo, pattern, lunghezza_testo, numero_elementi);

  return (0);

}

/*
* @brief implementazione Rabin Karp Matcher
**/
void rabin_karp_matcher(char testo[], char pattern[], int l_testo, int l_pattern) {

  int cnt_i, cnt_j, base_valori = l_testo, valore_massimo_testo = 1, p = 0, t = 0, nprimo = 13, contatore = 0;

  /* preelaborazione */
  for (cnt_i = 0; (cnt_i < l_pattern - 1); cnt_i++)                         
    valore_massimo_testo = (valore_massimo_testo * base_valori) % nprimo;
  for (cnt_i = 0; (cnt_i < l_pattern); cnt_i++) {
    p = (p * base_valori + pattern[cnt_i]) % nprimo;
    t = (t * base_valori + testo[cnt_i]) % nprimo;
  }
  /* fase di matching */
  for (cnt_i = 0; (cnt_i <= l_testo - l_pattern); cnt_i++) {
    if (p == t) {
      for (cnt_j = 0; (cnt_j < l_pattern); cnt_j++)
        if (pattern[cnt_j] != testo[cnt_i + cnt_j]) {
          break;
        }
      if (cnt_j == l_pattern)
        printf("Pattern con spostamento %d \n", cnt_i);
    }
    if (cnt_i < l_pattern - l_testo) {
      t = (base_valori * (t - testo[cnt_i] * valore_massimo_testo) + testo[cnt_i + l_pattern]) % nprimo;
      if (t < 0)
        t += nprimo;
    }
  }

}

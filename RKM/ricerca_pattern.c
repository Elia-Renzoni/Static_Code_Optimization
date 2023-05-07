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

#define MAX_VALORI 12

struct s_matching {
  char *testo, *pattern;
};

void rabin_karp_matcher(int, int);

int main(void) {

  struct s_matching accesso;
  FILE             *database;
  int               numero_caratteri, errore, lunghezza_pattern, contatore, caratteri_rest;
  char              carattere;

  database = fopen("database_aziendale.txt", "r");
  if (database == NULL)
    printf("Errore! Impossibile aprire il file !\n");
  else {
    
    for (caratteri_rest = fscanf(database, "%c", &carattere), numero_caratteri = 1; 
              (caratteri_rest  != EOF); 
        caratteri_rest = fscanf(database, "%c", &carattere), numero_caratteri++);

    accesso.testo = (char *)calloc(numero_caratteri, sizeof(char));

    for (contatore = 0; (contatore < numero_caratteri); contatore++)
      fscanf(database, "%c", &accesso.testo[contatore]);

    printf("Database Aziendale - Reparto Vendite > \n");

    do {
      printf("Lunghezza Pattern > \n");
      scanf("%d", &lunghezza_pattern);
      accesso.pattern = (char *)calloc(lunghezza_pattern, sizeof(char));
      printf("Inserisci Pattern - carattere per carattere \n");
      for (contatore = 0; (contatore < lunghezza_pattern); contatore++)
        scanf("%c", accesso.pattern[contatore]);

      errore = lunghezza_pattern < 1;
      if (errore) {
        printf("Errore, ripeti l'azione! \n");
        free(accesso.pattern);
      }
      while (getchar() != '\n');
    }
    while (errore);

    rabin_karp_matcher(numero_caratteri, lunghezza_pattern);

    fclose(database);
    free(accesso.testo);
    free(accesso.pattern);

  }

  return (0);

}

/*
* @brief implementazione Rabin Karp Matcher
**/
void rabin_karp_matcher(int l_testo, int l_pattern) {

  struct s_matching accesso;
  int               cnt_i, cnt_j, base_valori = l_testo, valore_massimo_testo = 1, p = 0, t = 0, nprimo = 13, contatore = 0;

  /* preelaborazione */
  for (cnt_i = 0; (cnt_i < l_testo - 1); cnt_i++)                         
    valore_massimo_testo = (valore_massimo_testo * base_valori) % nprimo;
  for (cnt_i = 0; (cnt_i < l_testo); cnt_i++) {
    p = (p * base_valori + accesso.pattern[cnt_i]) % nprimo;
    t = (t * base_valori + accesso.testo[cnt_i]) % nprimo;
  }
  /* fase di matching */
  for (cnt_i = 0; (cnt_i <= l_pattern - l_testo); cnt_i++) {
    if (p == t) {
      for (cnt_j = 0; (cnt_j < l_testo); cnt_j++)
        if (accesso.pattern[cnt_j] == accesso.testo[cnt_i + cnt_j])
          contatore++;
        else {
          cnt_j = l_testo;
          cnt_i = l_pattern + l_testo;
        }
    }
    if (cnt_i < l_pattern - l_testo)
      t = (base_valori * (t - accesso.testo[cnt_i] * valore_massimo_testo) + accesso.testo[cnt_i + l_testo]) % nprimo;
  }

  if (contatore == 0)
    printf("Pattern Non Trovato !");
  else 
    printf("Pattern Trovato %d volte !", (double) contatore / MAX_VALORI);


}

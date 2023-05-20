/*
*
* @authors Elia Renzoni - Alessio Visentino - Alessio Biagioli
* @date 18/05/2023
* @version 1.0
* @brief implementazione di un sistema di login - semplificato -
*
*/

#include <stdio.h>
#include <stdlib.h>

int *creazione_array(FILE *, int *);
void ordina_password(int *, int);
int ricerca_password(int *, int, int);

int main(void) {

  int *password, numero_elementi = 0, codice_utente;
  FILE *database;
  int risultato;

  database = fopen("database.txt", "r");
  if (database != NULL) {
    printf("Ciao ! \n");
    printf("Inventa un codice... mi raccomando tienilo stretto ! \n");
    scanf("%d", &codice_utente);
    password = creazione_array(database, &numero_elementi);
    ordina_password(password, numero_elementi);
    risultato = ricerca_password(password, codice_utente, numero_elementi);
    if (risultato == 1)
      printf("Codice Esistente ! \n");
    else
      printf("Codice Accettato ! \n");
  }
  else
    printf("Impossibile aprire il file ! \n");


  return (0);


}

int *creazione_array(FILE *database, int *numero_elementi) {

  int *password = NULL, contatore, valore;
  int  carattere_controllo;

  for (carattere_controllo = fscanf(database, "%d", &valore);
                  (carattere_controllo != EOF);
      carattere_controllo = fscanf(database, "%d", &valore))
        ++(*numero_elementi);
  password = (int *)calloc(*numero_elementi, sizeof(int));
  for (contatore = 0; (contatore < *numero_elementi); contatore++) {
    fscanf(database, "%d", &valore);
    password[contatore] = valore;
  }

  return (password);

}

void ordina_password(int *password, int numero_elementi) {

  int i, j, valore_min, indice_val_min;

  for (i = 0; (i < numero_elementi - 1); i++) {
    for (valore_min = password[i], indice_val_min = i, j = i + 1; (j < numero_elementi); j++) {
      if (password[j] < valore_min) {
        valore_min = password[j];
        indice_val_min = j;
      }
    }
    if (indice_val_min != i) {
      indice_val_min = j;
      password[indice_val_min] = password[i];
      password[i] = valore_min;
    }
  }

}

int ricerca_password(int *password, int codice_utente, int numero_elementi) {

  int sx, dx, mx;
  int risultato;

  for (sx = 0, dx = numero_elementi - 1, mx = (sx + dx) / 2;
              ((sx <= dx) && (password[mx] != codice_utente));
       mx = (sx + dx) / 2) {
        if (password[mx] > codice_utente)
          dx = mx - 1;
        else
          dx = mx + 1;
  }

  return (risultato = (sx <= dx)? 1 : 0);

}

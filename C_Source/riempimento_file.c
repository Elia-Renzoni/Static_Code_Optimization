/* * * * * * * * * * * * * * * *  * * * * * * * *  * * *
* @author Elia Renzoni
* @date 18/05/2023
* @brief programma per riempire il file database.txt
* * * *  * * * * * * * * * * * * * * *  * * * * * * * */

#include <stdio.h>
#include <stdlib.h>

#define MAX_VALUE 1200

int main(void) {

  int contatore, valore;
  FILE *database;

  database = fopen("database.txt", "w");
  if (database != NULL) {
    srand(1);
    for (contatore = 0; (contatore < MAX_VALUE); contatore++) {
      valore = rand() % (MAX_VALUE * MAX_VALUE);
      fprintf(database, "%d\n", valore);
    }
  }
  else
    printf("impossibile aprire il file ! \n");

  return (0);

}

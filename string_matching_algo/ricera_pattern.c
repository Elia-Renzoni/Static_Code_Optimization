/*
 *
 *   @author Elia Renzoni - Alessio Visentino
 *   @date 29/04/2023
 *   @brief implementazione KMP - Progetto Architettura degli Elaboratori
 * 
 * 
 * */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {
   citta, 
   armi
} scelta_t;

struct s_matching {
  char *testo, 
       *pattern;
  int  *spostamenti;
};

void funzione_prefisso(struct s_matching *, struct s_matching *);
void kmp_matcher(struct s_matching *, struct s_matching *, struct s_matching *);

int main(void) {
  
  struct s_matching accesso;
  FILE             *database;
  int               numero_caratteri, errore, lunghezza;
  scelta_t          scelta;
  char              carattere;
 
  database = fopen("shooting-1982-2023.txt", "r");
  if (database == NULL)
    printf("Errore! Impossibile aprire il file !\n");
  else {
    for (fscanf(database, "%c", &carattere), numero_caratteri = 1; (carattere != EOF); fscanf(database, "%c", &carattere), numero_caratteri++);
    accesso.testo = (struct s_matching *)calloc(numero_caratteri, sizeof(struct s_matching));
    for (int contatore = 0, fscanf(database, "%c", &accesso.testo[contatore]); (contatore <= numero_caratteri); fscanf(database, "%c", &accesso.testo[contatore]), contatore++);
   
    printf("Gugol\n\n");
    printf(" [0] cerca Città - Stati \n");
    printf(" [1] cerca Armi          \n");
    scanf("%d", &scelta);
    
    do {
      
      printf("Lunghezza Pattern > \n");
      scanf("%d", &lunghezza);
      accesso.pattern = (char *)calloc(lunghezza, sizeof(char));
      printf("Inserisci Pattern \n");
      scanf("%s", accesso.pattern);
      
      errore = lunghezza < 1;
      if (scelta = citta)
        accesso.pattern[0] = toupper(accesso.pattern[0]);
      else
        accesso.pattern[0] = tolower(accesso.pattern[0]);
      
      if (errore)
        printf("Errore, ripeti l'azione! \n");
        
      while (getchar() != '\n');
      
    } 
    while (errore);
    
    funzione_prefisso(accesso.pattern, accesso.spostamenti);
    kmp_matcher(accesso.testo, accesso.pattern, accesso.spostamenti);
    
  }
 
  return (0);
 
}

/*
* @brief funzione per calcolare gli spostamenti validi 
*
*/
void funzione_prefisso(struct s_matching *pattern, struct s_matching *spostamenti) {
  
  
  
  
}

/*
*
* @brief algoritmo di confronto per stringhe
*
**/
void kmp_matcher(struct s_matching *testo, struct s_matching *pattern, struct s_matching *spostamenti) {
  
  
  
}


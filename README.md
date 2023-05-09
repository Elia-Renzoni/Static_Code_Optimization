# Static Optimization
>* Authors : Elia Renzoni - Alessio Vinsentino - Alessio Biagioli
>* Problem : Static Code Optimization, using Assembly, of a String Matching Algorithm. 
>* University Project - Computer Architecture - Universitá Degli Studi di Urbino Carlo Bó - Applied Computer Science

## Rabin-Karp Algorithm > 
* C implementation : 
```C
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
        }
    }
    if (cnt_i < l_pattern - l_testo) {
      t = (base_valori * (t - accesso.testo[cnt_i] * valore_massimo_testo) + accesso.testo[cnt_i + l_testo]) % nprimo;
      if (t < 0)
        t += q;
    }
  }

  if (contatore == 0)
    printf("Pattern Non Trovato !");
  else 
    printf("Pattern Trovato %d volte !", contatore);


}

```
* Complexity : 

## MIPS Assembly Implementation > 


## Optimization > 


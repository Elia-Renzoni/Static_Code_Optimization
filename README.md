# Static Optimization
>* Authors : Elia Renzoni - Alessio Vinsentino - Alessio Biagioli
>* Problem : Static Code Optimization, using Assembly, of a String Matching Algorithm. 
>* University Project - Computer Architecture - Universitá Degli Studi di Urbino Carlo Bó - Applied Computer Science

## Rabin-Karp Algorithm > 

![](https://www2.hawaii.edu/~suthers/courses/ics311f20/Notes/Topic-23/code-Rabin-Karp-matcher.jpg) 
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
## MIPS Assembly Implementation > 
```Assembly
; Implementazione in MIPS Assembly dell'algoritmo di String Matching Rabin - Karp
; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @data 07/05/2023
; @copyright 2023



              .data
testo:                   .string 'a', 'b', 'a', 'c', 'a', 'b', 'b', 'c', 'a', 'b', 'a', 'a'           ; testo 
pattern:                 .string 'c', 'a', 'b'                                                        ; pattern
dimensione_testo:        .word 12
dimensione_pattern:      .word  3
numero_primo:            .word 13
base_valori:             .word 12                                                                     ; stesso valore della dimensione del testo
valore_massimo_testo:    .word 1
contatore_i:             .word 0
contatore_j:             .word 0
p:                       .word 0
t:                       .word 0


              .text
start:
      LW  r1, dimensione_testo(r0)                            ; caricamento in memoria dei valori
      LW  r2, dimensione_pattern(r0)
      LW  r3, numero_primo(r0)
      LW  r4, base_valori(r0)
      LW  r5, valore_massimo_testo(r0)
      LW  r6, contatore_i(r0)
      LW  r7, contatore_j(r0)
      LW  r8, p(r0)
      LW  r9, t(r0)
      DADDI r10, r0, testo                                     ; puntatore primo elemento dell'array - testo - 
      DADDI r11, r0, pattern                                   ; puntatore primo elemento dell'array - pattern - 

; TODO => riempimento dei loop, l'ordine delle istruzioni deve essere pensato senza avere in mente possibili ottimizzazzioni, in termini di instruction reordering. 

; preelaborazione
loop:
    MULT r5, r5, r4
    DIV r5, r5, r3
    MFHI r5
    DADDI r6, r6, 1
    BNE r6, r1, loop             ; if r7 != r1 then loop else break 
loop:
    ; TODO => aggiornare a 0 contatore_i
    LW r12, 0(r8)
    LW r13, 0(r9)
    MULT r8, r8, r4
    ADD r8, r8, r12
    DIV r8, r8, r3
    MFHI r8
    MULT r9, r9, r4
    ADD r9, r9, r13
    DIV r9, r9, r3
    MFHI r9
    DADDI r8, r8, 8
    DADDI r9, r9, 8
    DADDI r6, r6, 1
    BNE r6, r1, loop             ; if r6 != r1 then loop else break
      

; matching
ADD r12, r1, r2
ADD r6, r6, -r6                 ; da rivedere
loop1:
    BE r8, r9, loop2
    loop2:
    BNE r7, r1, loop2
    BNE r6, r12, loop1
    
end:
    HALT
```


## Static Optimization > 


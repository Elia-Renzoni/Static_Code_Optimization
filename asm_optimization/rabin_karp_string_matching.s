; Implementazione in Assembly dell'algoritmo di String Matching Rabin - Karp
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


              .text
start:
      LW  r3, dimensione_testo(r0)                            ; caricamento in memoria dei valori
      LW  r4, dimensione_pattern(r0)
      LW  r5, numero_primo(r0)
      LW  r6, base_valori(r0)
      DADDI r7, r0, testo                                     ; puntatore primo elemento dell'array - testo - 
      DADDI r8, r0, pattern                                   ; puntatore primo elemento dell'array - pattern - 

; TODO => riempimento dei loop, l'ordine delle istruzioni deve essere pensato senza avere in mente possibili ottimizzazzioni, in termini di instruction reordering. 
loop:


loop:


loop:


end:
    HALT


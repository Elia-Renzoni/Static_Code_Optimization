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
valore_massimo_testo:    .word 1
contatore_i:             .word 0
contatore_j:             .word 0


              .text
start:
      LW  r1, dimensione_testo(r0)                            ; caricamento in memoria dei valori
      LW  r2, dimensione_pattern(r0)
      LW  r3, numero_primo(r0)
      LW  r4, base_valori(r0)
      LW  r5, valore_massimo_testo(r0)
      LW  r6, contatore_i(r0)
      LW  r7, contatore_j(r0)
      DADDI r8, r0, testo                                     ; puntatore primo elemento dell'array - testo - 
      DADDI r9, r0, pattern                                   ; puntatore primo elemento dell'array - pattern - 

; TODO => riempimento dei loop, l'ordine delle istruzioni deve essere pensato senza avere in mente possibili ottimizzazzioni, in termini di instruction reordering. 

; preelaborazione
loop:
    MULT r5, r5, r4
    DIV r5, r5, r3
    MFHI r5
    DADDI r7, r7, 1
    BNE r7, r1, loop             ; if r7 != r1 then loop else break;
loop:

; matching
loop:

end:
    HALT


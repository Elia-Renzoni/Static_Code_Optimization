; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati


; TODO => Condizione del FOR - for (espr; indice_sx <= indice_dx && password[indice_mx] != codice_utente; espr);
                .data    
password: .word 12, 34, 56, 78, 123, 456, 678
nuovo_codice_utente: .word 56
indice_sx: .word 0
indice_dx: .word 6
indice_mx: .word 3
esito_ricerca: .word 0

                .text
start:
    lw r1, indice_sx(r0)
    lw r2, indice_dx(r0)
    lw r3, indice_mx(r0)
    lw r4, esito_ricerca(r0)
    lw r5, nuovo_codice_utente(r0)
    daddi r5, r3, password
 
dadd r6, r1, r2                       ; inizializzazione del contatore indice_mx
ddiv r3, r7, 2
loop:
  lw r7, 0(r5)
  ; slt r8, r1, r2                           ; if r1 < r2 
  ; bnez r8, cond2                           ; if r8 != 0 then cond2
  ; cond2: beq r1, r2, cond3                 ; if r1 = r2 then cond3
  ; cond3: bne r7, r5, ricerca               ; password[indice_mx] != codice_utente
  ricerca:
  slt r9, r5, r7                           ; if nuovo_codice_utente < password[indice_mx]
  bne r9, r0, spazio_ricerca_sinistra
  beq r9, r0, spazio_ricerca_destra
  dadd r3, r1, r2
  ddiv r5, r3, 2
  slt r8, r1, r2
  bnez r8, cond2
  cond2: beq r1, r2, cond3
  cond3: bne r7, r5, loop
  
 esito_ricerca: 
 slt r8, r5, r7
 bnez r8, codice_trovato
 codice_trovato:
 sw r4, 0(r3)
 codice_non_trovato:
 sw r4, 0(r4)
 
spazio_ricerca_sinistra: dsub r2, r3, 1           ; continua la ricerca nel sottoarray di sx. 
spazio_ricerca_destra: dadd r2, r3, 1             ; continua la ricerca nel sottoarray di dx.
end:
  halt

; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati

                .data    
password: .word 12, 34, 56, 78, 123, 456, 678
nuovo_codice_utente: .word 56
indice_sx: .word 0
indice_dx: .word 7
indice_mx: .word 0
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
  bne r1, r2, ricerca                 ; if r1 <= r2 then label
  ricerca:
  slt r8, r5, r7                      ; if nuovo_codice_utente < password[indice_mx]
  bne r8, r0, spazio_ricerca_sinistra
  beq r8, r0, spazio_ricerca_destra
  dadd r3, r1, r2
  ddiv r5, r3, 2
spazio_ricerca_sinistra:            ; continua la ricerca nel sottoarray di sx.
  dsub r2, r5, 1
spazio_ricerca_destra:              ; continua la ricerca nel sottoarray di dx.
  dadd r2, r5, 1
  
  
end:
  halt

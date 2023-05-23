; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati


                .data    
password: .word 12, 34, 56, 78, 123, 456, 678
nuovo_codice_utente: .word 56
indice_sx: .word 0
indice_dx: .word 6
indice_mx: .word 3
esito_ricerca: .word 0
media: .word 2
incremento: .word 1

                .text
start:
    lw r1, indice_sx(r0)
    lw r2, indice_dx(r0)
    lw r3, indice_mx(r0)
    lw r4, esito_ricerca(r0)
    lw r5, nuovo_codice_utente(r0)
    lw r6, media(r0)
    lw r7, incremento(r0)
    daddi r8, r3, password
 
dadd r9, r1, r2                       ; inizializzazione del contatore indice_mx
ddiv r3, r9, r6
loop:
  lw r10, 0(r8)
  slt r9, r5, r10                            ; if nuovo_codice_utente < password[indice_mx]
  bnez r9, spazio_ricerca_sinistra
  spazio_ricerca_sinistra: 
  dsub r2, r3, r7           ; continua la ricerca nel sottoarray di sx. 
  beqz r9, spazio_ricerca_destra
  spazio_ricerca_destra: 
  dadd r2, r3, r7             ; continua la ricerca nel sottoarray di dx.
  dadd r3, r1, r2
  ddiv r3, r3, r6
  dadd r8, r8, r3
  slt r9, r1, r2
  bnez r9, cond2
  cond2: 
  beq r1, r2, cond3
  cond3: 
  bne r10, r5, loop
  
 esito_ricerca: 
 slt r11, r1, r2
 bnez r11, codice_trovato
 codice_trovato:
 sw r4, 0(r7)
 beqz r11, codice_non_trovato
 codice_non_trovato: 
 sw r4, 0(r4)
 
end:
  halt

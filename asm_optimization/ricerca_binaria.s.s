; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati

          .data
password: .word 12, 37, 64, 57, 89, 95
codice_utente: .word 57
indice_sx: .word 0
indice_dx: .word 0
indice_mx: .word 0
esito_ricerca: .word 1

          .text
start: 
      lw r1, indice_sx(r0)
      lw r2, indice_dx(r0)
      lw r3, indice_mx(r0)
      lw r4, esito_ricerca(r0)
      lw r5, codice_utente(r0)
ricerca_loop:
      dadd r3, r1, r2
      ddiv r3, r3, 2
      daddi r6, r3, password
      slt r7, r1, r2
      bneqz r7, controlla_uguaglianza
      beqz r7, controlla_uguaglianza
      controlla_uguaglianza:
      beq r1, r2, seconda_validazione
      bneq r1, r2, fine_ricerca
      seconda_validazione:
      bneq r6, r5, continua_ricerca
      j fine_ricerca
      continua_ricerca:
      slt r8, r5, r6 
      bneqz r8, ricerca_in_sx
      ricerca_in_sx:
      dsub r2, r3, 1
      beqz r8, ricerca_in_dx
      ricerca_in_dx:
      daddi r1, r3 , 1
      j ricerca_loop
fine_ricerca:
      bneqz r7, trovato
      beqz r7, non_trovato
      trovato:
      sw r4, 0(r7)
      non_trovato:
      sw r4, 0(r7)
end:
      halt
      
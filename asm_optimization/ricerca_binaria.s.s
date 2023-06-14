; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati

          .data
password: .word 12, 37, 64, 57, 89, 95
codice_utente: .word 120
indice_sx: .word 0
indice_dx: .word 0
indice_mx: .word 0
divisore: .word  2
esito_ricerca: .word 1

          .text
start: 
      lw r1, indice_sx(r0)
      lw r2, indice_dx(r0)
      lw r3, indice_mx(r0)
      lw r4, esito_ricerca(r0)
      lw r5, codice_utente(r0)
      lw r6, divisore(r0)
ricerca_loop:
      dadd r3, r1, r2
      ddiv r3, r3, r6
      daddi r7, r3, password
      slt r8, r1, r2
      bnez r8, controlla_uguaglianza
      beqz r8, controlla_uguaglianza
      controlla_uguaglianza:
      beq r1, r2, seconda_validazione
      bne r1, r2, fine_ricerca
      seconda_validazione:
      bne r7, r5, continua_ricerca
      j fine_ricerca
      continua_ricerca:
      slt r9, r5, r7 
      bnez r9, ricerca_in_sx
      ricerca_in_sx:
      dsub r2, r3, r4 ; r4 perché riciclo i registri, in realta mi serve un 1
      beqz r9, ricerca_in_dx
      ricerca_in_dx:
      daddi r1, r3 , 1
      j ricerca_loop
fine_ricerca:
      bnez r8, trovato
      beqz r8, non_trovato
      trovato:
      sw r4, 0(r8)
      non_trovato:
      sw r4, 0(r8)
end:
      halt
      
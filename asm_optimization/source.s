; Implementazione in Assembly dell'algoritmo di String Matching Rabin - Karp
              .data
testo:                  .char 'a', 'b', 'a', 'c', 'a', 'b', 'b', 'c'
pattern:                .char 'c', 'a', 'b'
numero_caratteri_testo  .word  8
numero_carrateri_patt   .word  3
contatore_i             .word  0
contatore_j             .word  0
base_valori             .word  8
valore_massimo_testo    .word  1
p                       .word  0
t                       .word  0
numero_primo            .word  13
occorrenze              .word  0

              .text
start:
    loop: 

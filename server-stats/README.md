server-stats.sh
Script bash per analizzare rapidamente le prestazioni di un server Linux, usando solo strumenti già presenti su qualsiasi distribuzione (top, free, df, ps).

Cosa mostra
Uso totale CPU: percentuale di utilizzo, calcolata da top.
Uso memoria RAM: usata, libera e libera-con-cache, in MB e percentuale.
Uso disco: spazio usato e disponibile sulla partizione radice (/), in percentuale.
Top 5 processi per uso CPU
Top 5 processi per uso memoria
Uso
```bash chmod +x server-stats.sh ./server-stats.sh ```

Funziona su qualsiasi server Linux con bash e i comandi standard top, free, df, ps.

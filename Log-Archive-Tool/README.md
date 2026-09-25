
Panoramica

I log di sistema (solitamente posizionati in /var/log) tendono ad accumularsi nel tempo, occupando spazio prezioso sul disco. Log Archive Tool è uno script da riga di comando che automatizza la compressione e la gestione dei vecchi log racchiudendoli in un unico archivio compresso e li sposta in una cartella dedicata (/var/backups/log_archive), mantenendo il sistema pulito e conservando una copia storica dei dati.

Funzionalità Principali

Input flessibile: Accetta il percorso della cartella dei log come argomento da riga di comando (es. /var/log).

Compressione .tar.gz: Comprime tutti i file della cartella indicata usando il comando tar.

Nomenclatura dinamica con Timestamp: Genera archivi con data e ora nel formato logs_archive_AAAAMMGG_HHMMSS.tar.gz.

Registro delle operazioni (Log History): Mantiene un file di registro aggiornato (archive_history.log) per tracciare la data e l'ora di ciascuna archiviazione.

Gestione della destinazione: Crea automaticamente la directory /var/backups/log_archive se non esiste.

Guida all'Uso

Permessi ed Esecuzione

Prima di eseguire lo script, assicurati che sia eseguibile:

chmod +x log-archive.sh

Poiché la cartella di destinazione /var/backups/ e molti log di sistema richiedono i permessi di amministratore, lo script va eseguito con i privilegi di sudo.

Sintassi

sudo ./log-archive.sh

Esempio

sudo ./log-archive.sh /var/log

Come Funziona

Lettura Argomento: Lo script legge la cartella target fornita dall'utente tramite il parametro $1.

Creazione Directory: Verifica ed eventualmente crea la cartella di destinazione con mkdir -p /var/backups/log_archive.

Archiviazione e Compressione: Prende i file contenuti in LOG_DIR, crea l'archivio compresso .tar.gz e lo salva in ARCHIVE_DIR.

Tracciamento: Scrive una riga di testo nel file di log storico indicando il completamento e il timestamp dell'operazione.

#include<stdio.h>
#include<assert.h>
#include "sqlite3.h"
int main(){
    printf("hello world\n");
  // Open the source and destination database connections
    sqlite3 *srcDb, *destDb;
    int rc;
    rc = sqlite3_open("demo.sqlitedb", &srcDb);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Cannot open source database: %s\n", sqlite3_errmsg(srcDb));
        return 1;
    }
    else
    {
        printf("Source database opened successfully \n");
    }

    rc = sqlite3_open("destination.sqlitedb", &destDb);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Cannot open destination database: %s\n", sqlite3_errmsg(destDb));
        return 1;
    }
    else
    {
        printf("Destination database opened successfully \n");
    }

    // Create a backup object
    sqlite3_backup *backup = sqlite3_backup_init(destDb, "main", srcDb, "main");
    if (!backup) {
        fprintf(stderr, "Backup initialization failed: %s\n", sqlite3_errmsg(destDb));
        return 1;
    }
    else
    {
        printf("Successfully initialized the backup operation between source & destination database.\n");
    }

    // Perform the backup
   /* sqlite3_backup_step(backup, -1);
    sqlite3_backup_finish(backup);

    if (sqlite3_errcode(destDb) == SQLITE_OK) {
        printf("Backup completed successfully!\n");
    } else {
        fprintf(stderr, "Backup failed: %s\n", sqlite3_errmsg(destDb));
    }*/
    while ((rc = sqlite3_backup_step(backup, -1)) == SQLITE_OK) {
        // Backup in progress
    }

    if (rc == SQLITE_DONE) {
        printf("Backup completed successfully!\n");
    } else {
        fprintf(stderr, "Backup failed: %s\n", sqlite3_errmsg(destDb));
    }

    // Finish the backup
    sqlite3_backup_finish(backup);

    // Close the database connections
    sqlite3_close(srcDb);
    printf("Source database closed.\n");
    sqlite3_close(destDb);
    printf("Destination database closed.\n");

    return 0;
}

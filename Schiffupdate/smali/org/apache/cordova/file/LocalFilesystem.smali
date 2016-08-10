.class public Lorg/apache/cordova/file/LocalFilesystem;
.super Lorg/apache/cordova/file/Filesystem;
.source "LocalFilesystem.java"


# instance fields
.field private cordova:Lorg/apache/cordova/CordovaInterface;

.field private fsRoot:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p3, "fsRoot"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/cordova/file/Filesystem;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/cordova/file/LocalFilesystem;->name:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lorg/apache/cordova/file/LocalFilesystem;->fsRoot:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lorg/apache/cordova/file/LocalFilesystem;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 54
    return-void
.end method

.method private broadcastNewFile(Lorg/apache/cordova/file/LocalFilesystemURL;)V
    .locals 6
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 599
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 600
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 602
    iget-object v5, p0, Lorg/apache/cordova/file/LocalFilesystem;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 605
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 608
    .local v1, "context":Landroid/content/Context;
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    .line 611
    .local v4, "uri":Landroid/net/Uri;
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {v3, v5, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 614
    .local v3, "intent":Landroid/content/Intent;
    invoke-virtual {v1, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 616
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "context":Landroid/content/Context;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_0
    return-void
.end method

.method private copyAction(Ljava/io/File;Ljava/io/File;)V
    .locals 8
    .param p1, "srcFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 338
    .local v6, "istream":Ljava/io/FileInputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 339
    .local v7, "ostream":Ljava/io/FileOutputStream;
    invoke-virtual {v6}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 340
    .local v0, "input":Ljava/nio/channels/FileChannel;
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v5

    .line 343
    .local v5, "output":Ljava/nio/channels/FileChannel;
    const-wide/16 v1, 0x0

    :try_start_0
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v3

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 345
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    .line 346
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 347
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 348
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V

    .line 350
    return-void

    .line 345
    :catchall_0
    move-exception v1

    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    .line 346
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 347
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 348
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V

    throw v1
.end method

.method private copyDirectory(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "destinationDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/InvalidModificationException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 366
    new-instance v5, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v6, "Can\'t rename a file to a directory"

    invoke-direct {v5, v6}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 370
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lorg/apache/cordova/file/LocalFilesystem;->isCopyOnItself(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 371
    new-instance v5, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v6, "Can\'t copy itself into itself"

    invoke-direct {v5, v6}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 375
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 376
    invoke-virtual {p2}, Ljava/io/File;->mkdir()Z

    move-result v5

    if-nez v5, :cond_2

    .line 378
    new-instance v5, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v6, "Couldn\'t create the destination directory"

    invoke-direct {v5, v6}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 383
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_4

    aget-object v2, v0, v3

    .line 384
    .local v2, "file":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    .local v1, "destination":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 386
    invoke-direct {p0, v2, v1}, Lorg/apache/cordova/file/LocalFilesystem;->copyDirectory(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    .line 383
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 388
    :cond_3
    invoke-direct {p0, v2, v1}, Lorg/apache/cordova/file/LocalFilesystem;->copyFile(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    goto :goto_1

    .line 392
    .end local v1    # "destination":Ljava/io/File;
    .end local v2    # "file":Ljava/io/File;
    :cond_4
    invoke-virtual {p0, p2}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v5

    return-object v5
.end method

.method private copyFile(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "srcFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 323
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 324
    new-instance v0, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v1, "Can\'t rename a file to a directory"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 327
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/file/LocalFilesystem;->copyAction(Ljava/io/File;Ljava/io/File;)V

    .line 329
    invoke-virtual {p0, p2}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private fullPathForFilesystemPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "absolutePath"    # Ljava/lang/String;

    .prologue
    .line 74
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->fsRoot:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->fsRoot:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 77
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isCopyOnItself(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dest"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private moveDirectory(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "destinationDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 442
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 443
    new-instance v0, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v1, "Can\'t rename a file to a directory"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 447
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/cordova/file/LocalFilesystem;->isCopyOnItself(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 448
    new-instance v0, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v1, "Can\'t move itself into itself"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 452
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 453
    invoke-virtual {p2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_2

    .line 454
    new-instance v0, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v1, "directory is not empty"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 459
    :cond_2
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 464
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/file/LocalFilesystem;->copyDirectory(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    .line 465
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 466
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->removeDirRecursively(Ljava/io/File;)Z

    .line 472
    :cond_3
    invoke-virtual {p0, p2}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0

    .line 468
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "moved failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private moveFile(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "srcFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/InvalidModificationException;
        }
    .end annotation

    .prologue
    .line 407
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 408
    new-instance v0, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v1, "Can\'t rename a file to a directory"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 412
    :cond_0
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 417
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/file/LocalFilesystem;->copyAction(Ljava/io/File;Ljava/io/File;)V

    .line 418
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 419
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 425
    :cond_1
    invoke-virtual {p0, p2}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0

    .line 421
    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "moved failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->fullPathForFilesystemPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/LocalFilesystem;->URLforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v0

    return-object v0
.end method

.method protected URLforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 3
    .param p1, "fullPath"    # Ljava/lang/String;

    .prologue
    .line 81
    if-eqz p1, :cond_1

    .line 82
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    new-instance v0, Lorg/apache/cordova/file/LocalFilesystemURL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cdvfile://localhost/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/file/LocalFilesystem;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 87
    :goto_0
    return-object v0

    .line 85
    :cond_0
    new-instance v0, Lorg/apache/cordova/file/LocalFilesystemURL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cdvfile://localhost/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/file/LocalFilesystem;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 87
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 3
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 644
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    .line 645
    .local v1, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 646
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    return v2
.end method

.method public copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;
    .locals 9
    .param p1, "destURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "srcFs"    # Lorg/apache/cordova/file/Filesystem;
    .param p4, "srcURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p5, "move"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 480
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v4

    .line 481
    .local v4, "newParent":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 482
    .local v1, "destinationDir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 484
    new-instance v7, Ljava/io/FileNotFoundException;

    const-string v8, "The source does not exist"

    invoke-direct {v7, v8}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 487
    :cond_0
    const-class v7, Lorg/apache/cordova/file/LocalFilesystem;

    invoke-virtual {v7, p3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 491
    invoke-virtual {p0, p2, p4, p1}, Lorg/apache/cordova/file/LocalFilesystem;->makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v3

    .line 493
    .local v3, "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v6

    .line 494
    .local v6, "srcFilesystemPath":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 495
    .local v5, "sourceFile":Ljava/io/File;
    invoke-virtual {p0, v3}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v0

    .line 496
    .local v0, "destFilesystemPath":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 498
    .local v2, "destinationFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    .line 500
    new-instance v7, Ljava/io/FileNotFoundException;

    const-string v8, "The source does not exist"

    invoke-direct {v7, v8}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 504
    :cond_1
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 505
    new-instance v7, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v8, "Can\'t copy a file onto itself"

    invoke-direct {v7, v8}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 508
    :cond_2
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 509
    if-eqz p5, :cond_3

    .line 510
    invoke-direct {p0, v5, v2}, Lorg/apache/cordova/file/LocalFilesystem;->moveDirectory(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v7

    .line 524
    .end local v0    # "destFilesystemPath":Ljava/lang/String;
    .end local v2    # "destinationFile":Ljava/io/File;
    .end local v3    # "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .end local v5    # "sourceFile":Ljava/io/File;
    .end local v6    # "srcFilesystemPath":Ljava/lang/String;
    :goto_0
    return-object v7

    .line 512
    .restart local v0    # "destFilesystemPath":Ljava/lang/String;
    .restart local v2    # "destinationFile":Ljava/io/File;
    .restart local v3    # "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .restart local v5    # "sourceFile":Ljava/io/File;
    .restart local v6    # "srcFilesystemPath":Ljava/lang/String;
    :cond_3
    invoke-direct {p0, v5, v2}, Lorg/apache/cordova/file/LocalFilesystem;->copyDirectory(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v7

    goto :goto_0

    .line 515
    :cond_4
    if-eqz p5, :cond_5

    .line 516
    invoke-direct {p0, v5, v2}, Lorg/apache/cordova/file/LocalFilesystem;->moveFile(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v7

    goto :goto_0

    .line 518
    :cond_5
    invoke-direct {p0, v5, v2}, Lorg/apache/cordova/file/LocalFilesystem;->copyFile(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v7

    goto :goto_0

    .line 524
    .end local v0    # "destFilesystemPath":Ljava/lang/String;
    .end local v2    # "destinationFile":Ljava/io/File;
    .end local v3    # "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .end local v5    # "sourceFile":Ljava/io/File;
    .end local v6    # "srcFilesystemPath":Ljava/lang/String;
    :cond_6
    invoke-super/range {p0 .. p5}, Lorg/apache/cordova/file/Filesystem;->copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;

    move-result-object v7

    goto :goto_0
.end method

.method public filesystemPathForFullPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "fullPath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 57
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/cordova/file/LocalFilesystem;->fsRoot:Ljava/lang/String;

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "path":Ljava/lang/String;
    const-string v2, "?"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 59
    .local v1, "questionMark":I
    if-ltz v1, :cond_0

    .line 60
    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 62
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 65
    :cond_1
    return-object v0
.end method

.method public filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;
    .locals 1
    .param p1, "url"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 70
    iget-object v0, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForFullPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 140
    .local v1, "fp":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 141
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2}, Ljava/io/FileNotFoundException;-><init>()V

    throw v2

    .line 143
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v2

    if-nez v2, :cond_1

    .line 144
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2

    .line 147
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 148
    :catch_0
    move-exception v0

    .line 149
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2
.end method

.method public getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 8
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "options"    # Lorg/json/JSONObject;
    .param p4, "directory"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, "create":Z
    const/4 v1, 0x0

    .line 159
    .local v1, "exclusive":Z
    if-eqz p3, :cond_0

    .line 160
    const-string v4, "create"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 161
    if-eqz v0, :cond_0

    .line 162
    const-string v4, "exclusive"

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 167
    :cond_0
    const-string v4, ":"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 168
    new-instance v4, Lorg/apache/cordova/file/EncodingException;

    const-string v5, "This path has an invalid \":\" in it."

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/EncodingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 174
    :cond_1
    const-string v4, "/"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 175
    invoke-virtual {p0, p2}, Lorg/apache/cordova/file/LocalFilesystem;->URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v3

    .line 180
    .local v3, "requestedURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :goto_0
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0, v3}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 182
    .local v2, "fp":Ljava/io/File;
    if-eqz v0, :cond_5

    .line 183
    if-eqz v1, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 184
    new-instance v4, Lorg/apache/cordova/file/FileExistsException;

    const-string v5, "create/exclusive fails"

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/FileExistsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 177
    .end local v2    # "fp":Ljava/io/File;
    .end local v3    # "requestedURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/cordova/file/LocalFilesystem;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/cordova/file/LocalFilesystem;->URLforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v3

    .restart local v3    # "requestedURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    goto :goto_0

    .line 186
    .restart local v2    # "fp":Ljava/io/File;
    :cond_3
    if-eqz p4, :cond_4

    .line 187
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 191
    :goto_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_8

    .line 192
    new-instance v4, Lorg/apache/cordova/file/FileExistsException;

    const-string v5, "create fails"

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/FileExistsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 189
    :cond_4
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    goto :goto_1

    .line 196
    :cond_5
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_6

    .line 197
    new-instance v4, Ljava/io/FileNotFoundException;

    const-string v5, "path does not exist"

    invoke-direct {v4, v5}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 199
    :cond_6
    if-eqz p4, :cond_7

    .line 200
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 201
    new-instance v4, Lorg/apache/cordova/file/TypeMismatchException;

    const-string v5, "path doesn\'t exist or is file"

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/TypeMismatchException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 204
    :cond_7
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 205
    new-instance v4, Lorg/apache/cordova/file/TypeMismatchException;

    const-string v5, "path doesn\'t exist or is directory"

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/TypeMismatchException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 211
    :cond_8
    iget-object v4, v3, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    iget-object v5, v3, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    return-object v4
.end method

.method public getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 275
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 277
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 278
    new-instance v3, Ljava/io/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "File at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " does not exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 281
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 284
    .local v2, "metadata":Lorg/json/JSONObject;
    :try_start_0
    const-string v5, "size"

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    const-wide/16 v3, 0x0

    :goto_0
    invoke-virtual {v2, v5, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 285
    const-string v3, "type"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/cordova/file/LocalFilesystem;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/file/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 286
    const-string v3, "name"

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 287
    const-string v3, "fullPath"

    iget-object v4, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 288
    const-string v3, "lastModifiedDate"

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 292
    .end local v2    # "metadata":Lorg/json/JSONObject;
    :goto_1
    return-object v2

    .line 284
    .restart local v2    # "metadata":Lorg/json/JSONObject;
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->length()J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v3

    goto :goto_0

    .line 289
    :catch_0
    move-exception v0

    .line 290
    .local v0, "e":Lorg/json/JSONException;
    const/4 v2, 0x0

    goto :goto_1
.end method

.method getOutputStreamForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/io/OutputStream;
    .locals 3
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 651
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v2

    .line 652
    .local v2, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 653
    .local v0, "file":Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 654
    .local v1, "os":Ljava/io/FileOutputStream;
    return-object v1
.end method

.method public makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/cordova/file/LocalFilesystem;->fullPathForFilesystemPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 131
    iget-object v1, p0, Lorg/apache/cordova/file/LocalFilesystem;->name:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 133
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "rawPath"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 98
    const-string v6, "/"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    .line 99
    .local v4, "isAbsolutePath":Z
    if-eqz v4, :cond_0

    .line 100
    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 102
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    const-string v6, "/+"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 103
    .local v1, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "index":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_2

    .line 104
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, ".."

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 105
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 106
    if-lez v3, :cond_1

    .line 107
    add-int/lit8 v6, v3, -0x1

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 108
    add-int/lit8 v3, v3, -0x1

    .line 103
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 112
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .local v5, "normalizedPath":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 114
    .local v0, "component":Ljava/lang/String;
    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 117
    .end local v0    # "component":Ljava/lang/String;
    :cond_3
    if-eqz v4, :cond_4

    .line 118
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 120
    :goto_2
    return-object v6

    :cond_4
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_2
.end method

.method public readEntriesAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONArray;
    .locals 8
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 249
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 251
    .local v2, "fp":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 253
    new-instance v4, Ljava/io/FileNotFoundException;

    invoke-direct {v4}, Ljava/io/FileNotFoundException;-><init>()V

    throw v4

    .line 256
    :cond_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 258
    .local v0, "entries":Lorg/json/JSONArray;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 259
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 260
    .local v1, "files":[Ljava/io/File;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_2

    .line 261
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/io/File;->canRead()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 263
    :try_start_0
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/cordova/file/LocalFilesystem;->fullPathForFilesystemPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    aget-object v6, v1, v3

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aget-object v7, v1, v3

    invoke-static {v7}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 270
    .end local v1    # "files":[Ljava/io/File;
    .end local v3    # "i":I
    :cond_2
    return-object v0

    .line 264
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v3    # "i":I
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V
    .locals 9
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "start"    # J
    .param p4, "end"    # J
    .param p6, "readFileCallback"    # Lorg/apache/cordova/file/Filesystem$ReadFileCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 532
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 533
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/cordova/file/FileHelper;->getMimeTypeForExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 535
    .local v0, "contentType":Ljava/lang/String;
    cmp-long v6, p4, v7

    if-gez v6, :cond_0

    .line 536
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide p4

    .line 538
    :cond_0
    sub-long v3, p4, p2

    .line 540
    .local v3, "numBytesToRead":J
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 542
    .local v5, "rawInputStream":Ljava/io/InputStream;
    cmp-long v6, p2, v7

    if-lez v6, :cond_1

    .line 543
    :try_start_0
    invoke-virtual {v5, p2, p3}, Ljava/io/InputStream;->skip(J)J

    .line 545
    :cond_1
    new-instance v2, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;

    invoke-direct {v2, p0, v5, v3, v4}, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;-><init>(Lorg/apache/cordova/file/Filesystem;Ljava/io/InputStream;J)V

    .line 546
    .local v2, "inputStream":Lorg/apache/cordova/file/Filesystem$LimitedInputStream;
    invoke-interface {p6, v2, v0}, Lorg/apache/cordova/file/Filesystem$ReadFileCallback;->handleData(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 550
    return-void

    .line 548
    .end local v2    # "inputStream":Lorg/apache/cordova/file/Filesystem$LimitedInputStream;
    :catchall_0
    move-exception v6

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    throw v6
.end method

.method public recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 2
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 229
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 230
    .local v0, "directory":Ljava/io/File;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/LocalFilesystem;->removeDirRecursively(Ljava/io/File;)Z

    move-result v1

    return v1
.end method

.method protected removeDirRecursively(Ljava/io/File;)Z
    .locals 7
    .param p1, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 235
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 236
    .local v1, "file":Ljava/io/File;
    invoke-virtual {p0, v1}, Lorg/apache/cordova/file/LocalFilesystem;->removeDirRecursively(Ljava/io/File;)Z

    .line 235
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 240
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_1

    .line 241
    new-instance v4, Lorg/apache/cordova/file/FileExistsException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "could not delete: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/FileExistsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 243
    :cond_1
    const/4 v4, 0x1

    return v4
.end method

.method public removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 3
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/InvalidModificationException;
        }
    .end annotation

    .prologue
    .line 217
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 220
    .local v0, "fp":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-lez v1, :cond_0

    .line 221
    new-instance v1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v2, "You can\'t delete a directory that is not empty."

    invoke-direct {v1, v2}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 224
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    return v1
.end method

.method public truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J
    .locals 6
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "size"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 620
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 622
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 623
    new-instance v3, Ljava/io/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "File at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " does not exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 626
    :cond_0
    new-instance v2, Ljava/io/RandomAccessFile;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "rw"

    invoke-direct {v2, v3, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 628
    .local v2, "raf":Ljava/io/RandomAccessFile;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    cmp-long v3, v3, p2

    if-ltz v3, :cond_1

    .line 629
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 630
    .local v0, "channel":Ljava/nio/channels/FileChannel;
    invoke-virtual {v0, p2, p3}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 636
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    .end local v0    # "channel":Ljava/nio/channels/FileChannel;
    .end local p2    # "size":J
    :goto_0
    return-wide p2

    .line 634
    .restart local p2    # "size":J
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide p2

    .line 636
    .end local p2    # "size":J
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    goto :goto_0

    .restart local p2    # "size":J
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    throw v3
.end method

.method public writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J
    .locals 10
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "isBinary"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 556
    const/4 v0, 0x0

    .line 557
    .local v0, "append":Z
    if-lez p3, :cond_0

    .line 558
    int-to-long v7, p3

    invoke-virtual {p0, p1, v7, v8}, Lorg/apache/cordova/file/LocalFilesystem;->truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J

    .line 559
    const/4 v0, 0x1

    .line 563
    :cond_0
    if-eqz p4, :cond_1

    .line 564
    invoke-static {p2, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    .line 568
    .local v5, "rawData":[B
    :goto_0
    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 571
    .local v3, "in":Ljava/io/ByteArrayInputStream;
    :try_start_0
    array-length v7, v5

    new-array v1, v7, [B

    .line 572
    .local v1, "buff":[B
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 574
    .local v4, "out":Ljava/io/FileOutputStream;
    const/4 v7, 0x0

    :try_start_1
    array-length v8, v1

    invoke-virtual {v3, v1, v7, v8}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 575
    const/4 v7, 0x0

    array-length v8, v5

    invoke-virtual {v4, v1, v7, v8}, Ljava/io/FileOutputStream;->write([BII)V

    .line 576
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 579
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 581
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->broadcastNewFile(Lorg/apache/cordova/file/LocalFilesystemURL;)V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0

    .line 590
    array-length v7, v5

    int-to-long v7, v7

    return-wide v7

    .line 566
    .end local v1    # "buff":[B
    .end local v3    # "in":Ljava/io/ByteArrayInputStream;
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .end local v5    # "rawData":[B
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    .restart local v5    # "rawData":[B
    goto :goto_0

    .line 579
    .restart local v1    # "buff":[B
    .restart local v3    # "in":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v7

    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    throw v7
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0

    .line 583
    .end local v1    # "buff":[B
    .end local v4    # "out":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 586
    .local v2, "e":Ljava/lang/NullPointerException;
    new-instance v6, Lorg/apache/cordova/file/NoModificationAllowedException;

    invoke-virtual {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    .line 587
    .local v6, "realException":Lorg/apache/cordova/file/NoModificationAllowedException;
    throw v6
.end method

.class public Lorg/apache/cordova/file/DirectoryManager;
.super Ljava/lang/Object;
.source "DirectoryManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "DirectoryManager"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static constructFilePaths(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p0, "file1"    # Ljava/lang/String;
    .param p1, "file2"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 126
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 131
    .local v0, "newPath":Ljava/io/File;
    :goto_0
    return-object v0

    .line 129
    .end local v0    # "newPath":Ljava/io/File;
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v0    # "newPath":Ljava/io/File;
    goto :goto_0
.end method

.method private static freeSpaceCalculation(Ljava/lang/String;)J
    .locals 9
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 89
    new-instance v4, Landroid/os/StatFs;

    invoke-direct {v4, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 90
    .local v4, "stat":Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-long v2, v5

    .line 91
    .local v2, "blockSize":J
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v5

    int-to-long v0, v5

    .line 92
    .local v0, "availableBlocks":J
    mul-long v5, v0, v2

    const-wide/16 v7, 0x400

    div-long/2addr v5, v7

    return-wide v5
.end method

.method public static getFreeDiskSpace(Z)J
    .locals 5
    .param p0, "checkInternal"    # Z

    .prologue
    .line 64
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    .line 65
    .local v2, "status":Ljava/lang/String;
    const-wide/16 v0, 0x0

    .line 68
    .local v0, "freeSpace":J
    const-string v3, "mounted"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 69
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/cordova/file/DirectoryManager;->freeSpaceCalculation(Ljava/lang/String;)J

    move-result-wide v0

    :goto_0
    move-wide v3, v0

    .line 79
    :goto_1
    return-wide v3

    .line 71
    :cond_0
    if-eqz p0, :cond_1

    .line 72
    const-string v3, "/"

    invoke-static {v3}, Lorg/apache/cordova/file/DirectoryManager;->freeSpaceCalculation(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_0

    .line 76
    :cond_1
    const-wide/16 v3, -0x1

    goto :goto_1
.end method

.method public static testFileExists(Ljava/lang/String;)Z
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-static {}, Lorg/apache/cordova/file/DirectoryManager;->testSaveLocationExists()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 47
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 48
    .local v1, "path":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p0}, Lorg/apache/cordova/file/DirectoryManager;->constructFilePaths(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 49
    .local v0, "newPath":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    .line 55
    .end local v0    # "newPath":Ljava/io/File;
    .end local v1    # "path":Ljava/io/File;
    .local v2, "status":Z
    :goto_0
    return v2

    .line 53
    .end local v2    # "status":Z
    :cond_0
    const/4 v2, 0x0

    .restart local v2    # "status":Z
    goto :goto_0
.end method

.method public static testSaveLocationExists()Z
    .locals 3

    .prologue
    .line 101
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "sDCardStatus":Ljava/lang/String;
    const-string v2, "mounted"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 106
    const/4 v1, 0x1

    .line 113
    .local v1, "status":Z
    :goto_0
    return v1

    .line 111
    .end local v1    # "status":Z
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "status":Z
    goto :goto_0
.end method

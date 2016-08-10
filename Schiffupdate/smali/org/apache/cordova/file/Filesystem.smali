.class public abstract Lorg/apache/cordova/file/Filesystem;
.super Ljava/lang/Object;
.source "Filesystem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/file/Filesystem$LimitedInputStream;,
        Lorg/apache/cordova/file/Filesystem$ReadFileCallback;
    }
.end annotation


# instance fields
.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    return-void
.end method

.method public static makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 8
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "fsName"    # Ljava/lang/String;
    .param p2, "isDir"    # Ljava/lang/Boolean;
    .param p3, "nativeURL"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 42
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 44
    .local v1, "entry":Lorg/json/JSONObject;
    const-string v6, "/"

    invoke-virtual {p0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v4

    .line 45
    .local v0, "end":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v0

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, "/+"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, "parts":[Ljava/lang/String;
    array-length v6, v3

    add-int/lit8 v6, v6, -0x1

    aget-object v2, v3, v6

    .line 47
    .local v2, "fileName":Ljava/lang/String;
    const-string v7, "isFile"

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_2

    move v6, v4

    :goto_1
    invoke-virtual {v1, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 48
    const-string v6, "isDirectory"

    invoke-virtual {v1, v6, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    const-string v6, "name"

    invoke-virtual {v1, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 50
    const-string v6, "fullPath"

    invoke-virtual {v1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    const-string v6, "filesystemName"

    invoke-virtual {v1, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    const-string v6, "filesystem"

    const-string v7, "temporary"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    :goto_2
    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 57
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "/"

    invoke-virtual {p3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 60
    :cond_0
    const-string v4, "nativeURL"

    invoke-virtual {v1, v4, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    return-object v1

    .end local v0    # "end":I
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "parts":[Ljava/lang/String;
    :cond_1
    move v0, v5

    .line 44
    goto :goto_0

    .restart local v0    # "end":I
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "parts":[Ljava/lang/String;
    :cond_2
    move v6, v5

    .line 47
    goto :goto_1

    :cond_3
    move v5, v4

    .line 55
    goto :goto_2
.end method

.method public static makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p0, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p1, "isDir"    # Ljava/lang/Boolean;
    .param p2, "nativeURL"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    invoke-static {v0, v1, p1, p2}, Lorg/apache/cordova/file/Filesystem;->makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method abstract URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
.end method

.method abstract canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
.end method

.method copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;
    .locals 8
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
    .line 119
    if-eqz p5, :cond_0

    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 120
    :cond_0
    invoke-virtual {p0, p2, p4, p1}, Lorg/apache/cordova/file/Filesystem;->makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v7

    .line 121
    .local v7, "destination":Lorg/apache/cordova/file/LocalFilesystemURL;
    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    new-instance v6, Lorg/apache/cordova/file/Filesystem$1;

    invoke-direct {v6, p0, v7}, Lorg/apache/cordova/file/Filesystem$1;-><init>(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;)V

    move-object v0, p3

    move-object v1, p4

    invoke-virtual/range {v0 .. v6}, Lorg/apache/cordova/file/Filesystem;->readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V

    .line 143
    if-eqz p5, :cond_1

    .line 145
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    .line 147
    :cond_1
    invoke-virtual {p0, v7}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0

    .line 149
    .end local v7    # "destination":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_2
    new-instance v0, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v1, "Cannot move file at source URL"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method abstract filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;
.end method

.method abstract getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method abstract getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation
.end method

.method abstract getOutputStreamForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getParentForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    iget-object v3, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-direct {v2, v3}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Landroid/net/Uri;)V

    .line 84
    .local v2, "newURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    const-string v3, ""

    iget-object v4, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "/"

    iget-object v4, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 85
    iget-object v3, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    const-string v4, "/+$"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "dirURL":Ljava/lang/String;
    const/16 v3, 0x2f

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    add-int/lit8 v1, v3, 0x1

    .line 87
    .local v1, "lastPathStartsAt":I
    iget-object v3, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    .line 89
    .end local v0    # "dirURL":Ljava/lang/String;
    .end local v1    # "lastPathStartsAt":I
    :cond_0
    invoke-virtual {p0, v2}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object v3

    return-object v3
.end method

.method protected makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 3
    .param p1, "newName"    # Ljava/lang/String;
    .param p2, "srcURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p3, "destURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 94
    const-string v1, "null"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 95
    :cond_0
    iget-object v1, p2, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    .line 98
    :cond_1
    iget-object v1, p3, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "newDest":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    :goto_0
    new-instance v1, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v1, v0}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 102
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 204
    const/4 v0, 0x0

    return-object v0
.end method

.method abstract readEntriesAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation
.end method

.method abstract readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation
.end method

.method abstract removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation
.end method

.method abstract truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation
.end method

.method abstract writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

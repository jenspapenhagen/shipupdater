.class public Lorg/apache/cordova/file/ContentFilesystem;
.super Lorg/apache/cordova/file/Filesystem;
.source "ContentFilesystem.java"


# instance fields
.field private cordova:Lorg/apache/cordova/CordovaInterface;

.field private resourceApi:Lorg/apache/cordova/CordovaResourceApi;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p3, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/file/Filesystem;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/apache/cordova/file/ContentFilesystem;->name:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lorg/apache/cordova/file/ContentFilesystem;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 53
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 54
    .local v4, "webViewClass":Ljava/lang/Class;
    const/4 v2, 0x0

    .line 56
    .local v2, "pm":Lorg/apache/cordova/PluginManager;
    :try_start_0
    const-string v5, "getPluginManager"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 57
    .local v1, "gpm":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v1, p3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lorg/apache/cordova/PluginManager;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    .line 62
    .end local v1    # "gpm":Ljava/lang/reflect/Method;
    :goto_0
    if-nez v2, :cond_0

    .line 64
    :try_start_1
    const-string v5, "pluginManager"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 65
    .local v3, "pmf":Ljava/lang/reflect/Field;
    invoke-virtual {v3, p3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lorg/apache/cordova/PluginManager;

    move-object v2, v0
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 70
    .end local v3    # "pmf":Ljava/lang/reflect/Field;
    :cond_0
    :goto_1
    new-instance v5, Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {p3}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Lorg/apache/cordova/CordovaResourceApi;-><init>(Landroid/content/Context;Lorg/apache/cordova/PluginManager;)V

    iput-object v5, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    .line 71
    return-void

    .line 67
    :catch_0
    move-exception v5

    goto :goto_1

    .line 66
    :catch_1
    move-exception v5

    goto :goto_1

    .line 60
    :catch_2
    move-exception v5

    goto :goto_0

    .line 59
    :catch_3
    move-exception v5

    goto :goto_0

    .line 58
    :catch_4
    move-exception v5

    goto :goto_0
.end method


# virtual methods
.method public URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 311
    const/4 v0, 0x0

    return-object v0
.end method

.method public canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 3
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 316
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/ContentFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    .line 317
    .local v1, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 318
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    return v2
.end method

.method public copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;
    .locals 6
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
    .line 200
    const-class v4, Lorg/apache/cordova/file/LocalFilesystem;

    invoke-virtual {v4, p3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 203
    invoke-virtual {p0, p2, p4, p1}, Lorg/apache/cordova/file/ContentFilesystem;->makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v0

    .line 205
    .local v0, "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    iget-object v4, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iget-object v5, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CordovaResourceApi;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v3

    .line 206
    .local v3, "os":Ljava/io/OutputStream;
    iget-object v4, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iget-object v5, p4, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v2

    .line 207
    .local v2, "ofrr":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    if-eqz p5, :cond_0

    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 208
    new-instance v4, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v5, "Cannot move file at source URL"

    invoke-direct {v4, v5}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 211
    :cond_0
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {v4, v2, v3}, Lorg/apache/cordova/CordovaResourceApi;->copyResource(Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    if-eqz p5, :cond_1

    .line 216
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    .line 218
    :cond_1
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v5, v0, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v5}, Lorg/apache/cordova/file/ContentFilesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 221
    .end local v0    # "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .end local v2    # "ofrr":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v3    # "os":Ljava/io/OutputStream;
    :goto_0
    return-object v4

    .line 212
    .restart local v0    # "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .restart local v2    # "ofrr":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v3    # "os":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 213
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Cannot read file at source URL"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 221
    .end local v0    # "destinationURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "ofrr":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v3    # "os":Ljava/io/OutputStream;
    :cond_2
    invoke-super/range {p0 .. p5}, Lorg/apache/cordova/file/Filesystem;->copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;

    move-result-object v4

    goto :goto_0
.end method

.method protected filesystemPathForCursor(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v3, 0x0

    .line 263
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/String;

    const-string v2, "_data"

    aput-object v2, v0, v3

    .line 264
    .local v0, "LOCAL_FILE_PROJECTION":[Ljava/lang/String;
    aget-object v2, v0, v3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 265
    .local v1, "columnIndex":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 266
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 268
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;
    .locals 2
    .param p1, "url"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 296
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/ContentFilesystem;->openCursorForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/database/Cursor;

    move-result-object v0

    .line 298
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_2

    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 299
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/ContentFilesystem;->filesystemPathForCursor(Landroid/database/Cursor;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 302
    if-eqz v0, :cond_0

    .line 303
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 305
    :cond_0
    :goto_0
    return-object v1

    .line 302
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 303
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 302
    :cond_1
    throw v1

    :cond_2
    if-eqz v0, :cond_3

    .line 303
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 305
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const-string v3, "/"

    iget-object v4, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 77
    const/4 v3, 0x1

    :try_start_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iget-object v4, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v3, v4}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 101
    :goto_0
    return-object v3

    .line 78
    :catch_0
    move-exception v1

    .line 79
    .local v1, "e":Lorg/json/JSONException;
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    throw v3

    .line 84
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/ContentFilesystem;->openCursorForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/database/Cursor;

    move-result-object v0

    .line 85
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 87
    .local v2, "filePath":Ljava/lang/String;
    if-eqz v0, :cond_1

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-nez v3, :cond_3

    .line 88
    :cond_1
    new-instance v3, Ljava/io/FileNotFoundException;

    invoke-direct {v3}, Ljava/io/FileNotFoundException;-><init>()V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_2

    .line 93
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 92
    :cond_2
    throw v3

    .line 90
    :cond_3
    :try_start_2
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/ContentFilesystem;->filesystemPathForCursor(Landroid/database/Cursor;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 92
    if-eqz v0, :cond_4

    .line 93
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 95
    :cond_4
    if-nez v2, :cond_5

    .line 96
    iget-object v3, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 101
    :goto_1
    :try_start_3
    iget-object v3, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    iget-object v4, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v3, v4, v5, v2}, Lorg/apache/cordova/file/ContentFilesystem;->makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v3

    goto :goto_0

    .line 98
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 102
    :catch_1
    move-exception v1

    .line 103
    .restart local v1    # "e":Lorg/json/JSONException;
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    throw v3
.end method

.method public getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 6
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "options"    # Lorg/json/JSONObject;
    .param p4, "directory"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 110
    if-eqz p3, :cond_0

    .line 111
    const-string v2, "create"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Cannot create content url"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 115
    :cond_0
    new-instance v1, Lorg/apache/cordova/file/LocalFilesystemURL;

    iget-object v2, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-static {v2, p2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Landroid/net/Uri;)V

    .line 116
    .local v1, "requestedURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, v1}, Lorg/apache/cordova/file/ContentFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 117
    .local v0, "fp":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 118
    new-instance v2, Ljava/io/FileNotFoundException;

    const-string v3, "path does not exist"

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 120
    :cond_1
    if-eqz p4, :cond_2

    .line 121
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 122
    new-instance v2, Lorg/apache/cordova/file/TypeMismatchException;

    const-string v3, "path doesn\'t exist or is file"

    invoke-direct {v2, v3}, Lorg/apache/cordova/file/TypeMismatchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 125
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 126
    new-instance v2, Lorg/apache/cordova/file/TypeMismatchException;

    const-string v3, "path doesn\'t exist or is directory"

    invoke-direct {v2, v3}, Lorg/apache/cordova/file/TypeMismatchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_3
    iget-object v2, v1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    iget-object v3, v1, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lorg/apache/cordova/file/ContentFilesystem;->makeEntryForPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2
.end method

.method public getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 8
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 167
    const/4 v4, 0x0

    .line 168
    .local v4, "size":Ljava/lang/Integer;
    const/4 v2, 0x0

    .line 169
    .local v2, "lastModified":Ljava/lang/Integer;
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/ContentFilesystem;->openCursorForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/database/Cursor;

    move-result-object v0

    .line 171
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_1

    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 172
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/ContentFilesystem;->resourceSizeForCursor(Landroid/database/Cursor;)Ljava/lang/Integer;

    move-result-object v4

    .line 173
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/ContentFilesystem;->lastModifiedDateForCursor(Landroid/database/Cursor;)Ljava/lang/Integer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 178
    if-eqz v0, :cond_0

    .line 179
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 182
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 184
    .local v3, "metadata":Lorg/json/JSONObject;
    :try_start_1
    const-string v5, "size"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    const-string v5, "type"

    iget-object v6, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iget-object v7, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v6, v7}, Lorg/apache/cordova/CordovaResourceApi;->getMimeType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    const-string v5, "name"

    iget-object v6, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 187
    const-string v5, "fullPath"

    iget-object v6, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    const-string v5, "lastModifiedDate"

    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 192
    .end local v3    # "metadata":Lorg/json/JSONObject;
    :goto_0
    return-object v3

    .line 175
    :cond_1
    :try_start_2
    new-instance v5, Ljava/io/FileNotFoundException;

    invoke-direct {v5}, Ljava/io/FileNotFoundException;-><init>()V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 178
    :catchall_0
    move-exception v5

    if-eqz v0, :cond_2

    .line 179
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 178
    :cond_2
    throw v5

    .line 189
    .restart local v3    # "metadata":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 190
    .local v1, "e":Lorg/json/JSONException;
    const/4 v3, 0x0

    goto :goto_0
.end method

.method getOutputStreamForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/io/OutputStream;
    .locals 3
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    iget-object v1, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iget-object v2, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaResourceApi;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 325
    .local v0, "os":Ljava/io/OutputStream;
    return-object v0
.end method

.method protected lastModifiedDateForCursor(Landroid/database/Cursor;)Ljava/lang/Integer;
    .locals 5
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v4, 0x0

    .line 283
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/String;

    const-string v3, "date_modified"

    aput-object v3, v0, v4

    .line 284
    .local v0, "LOCAL_FILE_PROJECTION":[Ljava/lang/String;
    aget-object v3, v0, v4

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 285
    .local v1, "columnIndex":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 286
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 287
    .local v2, "dateStr":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 288
    const/16 v3, 0xa

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 291
    .end local v2    # "dateStr":Ljava/lang/String;
    :goto_0
    return-object v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected openCursorForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/database/Cursor;
    .locals 7
    .param p1, "url"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    const/4 v2, 0x0

    .line 257
    iget-object v1, p0, Lorg/apache/cordova/file/ContentFilesystem;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 258
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    iget-object v1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 259
    .local v6, "cursor":Landroid/database/Cursor;
    return-object v6
.end method

.method public readEntriesAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONArray;
    .locals 1
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 162
    const/4 v0, 0x0

    return-object v0
.end method

.method public readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V
    .locals 8
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
    const-wide/16 v6, 0x0

    .line 229
    iget-object v4, p0, Lorg/apache/cordova/file/ContentFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iget-object v5, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->URL:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v3

    .line 230
    .local v3, "ofrr":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    cmp-long v4, p4, v6

    if-gez v4, :cond_0

    .line 231
    iget-wide p4, v3, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    .line 233
    :cond_0
    sub-long v1, p4, p2

    .line 235
    .local v1, "numBytesToRead":J
    cmp-long v4, p2, v6

    if-lez v4, :cond_1

    .line 236
    :try_start_0
    iget-object v4, v3, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v4, p2, p3}, Ljava/io/InputStream;->skip(J)J

    .line 238
    :cond_1
    new-instance v0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;

    iget-object v4, v3, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-direct {v0, p0, v4, v1, v2}, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;-><init>(Lorg/apache/cordova/file/Filesystem;Ljava/io/InputStream;J)V

    .line 239
    .local v0, "inputStream":Lorg/apache/cordova/file/Filesystem$LimitedInputStream;
    iget-object v4, v3, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->mimeType:Ljava/lang/String;

    invoke-interface {p6, v0, v4}, Lorg/apache/cordova/file/Filesystem$ReadFileCallback;->handleData(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    iget-object v4, v3, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 243
    return-void

    .line 241
    .end local v0    # "inputStream":Lorg/apache/cordova/file/Filesystem$LimitedInputStream;
    :catchall_0
    move-exception v4

    iget-object v5, v3, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    throw v4
.end method

.method public recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 2
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 155
    new-instance v0, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v1, "Cannot remove content url"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 7
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/ContentFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "filePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 141
    .local v0, "file":Ljava/io/File;
    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/file/ContentFilesystem;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v4, "_data = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v2

    return v2

    .line 144
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected resourceSizeForCursor(Landroid/database/Cursor;)Ljava/lang/Integer;
    .locals 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 272
    const-string v2, "_size"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 273
    .local v0, "columnIndex":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 274
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 275
    .local v1, "sizeStr":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 276
    const/16 v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 279
    .end local v1    # "sizeStr":Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J
    .locals 2
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "size"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 253
    new-instance v0, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v1, "Couldn\'t truncate file given its content URI"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J
    .locals 2
    .param p1, "inputURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "isBinary"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 248
    new-instance v0, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v1, "Couldn\'t write to file given its content URI"

    invoke-direct {v0, v1}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

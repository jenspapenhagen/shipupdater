.class Lorg/apache/cordova/file/Filesystem$1;
.super Ljava/lang/Object;
.source "Filesystem.java"

# interfaces
.implements Lorg/apache/cordova/file/Filesystem$ReadFileCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/Filesystem;->copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/Filesystem;

.field final synthetic val$destination:Lorg/apache/cordova/file/LocalFilesystemURL;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lorg/apache/cordova/file/Filesystem$1;->this$0:Lorg/apache/cordova/file/Filesystem;

    iput-object p2, p0, Lorg/apache/cordova/file/Filesystem$1;->val$destination:Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleData(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 8
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x2000

    const/4 v6, 0x0

    .line 123
    if-eqz p1, :cond_1

    .line 125
    iget-object v4, p0, Lorg/apache/cordova/file/Filesystem$1;->this$0:Lorg/apache/cordova/file/Filesystem;

    iget-object v5, p0, Lorg/apache/cordova/file/Filesystem$1;->val$destination:Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/file/Filesystem;->getOutputStreamForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/io/OutputStream;

    move-result-object v3

    .line 126
    .local v3, "os":Ljava/io/OutputStream;
    const/16 v0, 0x2000

    .line 127
    .local v0, "BUFFER_SIZE":I
    new-array v1, v7, [B

    .line 130
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {p1, v1, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 132
    .local v2, "bytesRead":I
    if-gtz v2, :cond_0

    .line 137
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 141
    return-void

    .line 135
    :cond_0
    invoke-virtual {v3, v1, v6, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 139
    .end local v0    # "BUFFER_SIZE":I
    .end local v1    # "buffer":[B
    .end local v2    # "bytesRead":I
    .end local v3    # "os":Ljava/io/OutputStream;
    :cond_1
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Cannot read file at source URL"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

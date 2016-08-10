.class public Lorg/apache/cordova/file/FileUtils;
.super Lorg/apache/cordova/CordovaPlugin;
.source "FileUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/file/FileUtils$FileOp;
    }
.end annotation


# static fields
.field public static ABORT_ERR:I = 0x0

.field public static ENCODING_ERR:I = 0x0

.field public static INVALID_MODIFICATION_ERR:I = 0x0

.field public static INVALID_STATE_ERR:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "FileUtils"

.field public static NOT_FOUND_ERR:I

.field public static NOT_READABLE_ERR:I

.field public static NO_MODIFICATION_ALLOWED_ERR:I

.field public static PATH_EXISTS_ERR:I

.field public static QUOTA_EXCEEDED_ERR:I

.field public static SECURITY_ERR:I

.field public static SYNTAX_ERR:I

.field public static TYPE_MISMATCH_ERR:I

.field public static UNKNOWN_ERR:I

.field private static filePlugin:Lorg/apache/cordova/file/FileUtils;


# instance fields
.field private configured:Z

.field private filesystems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/file/Filesystem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/file/FileUtils;->NOT_FOUND_ERR:I

    .line 56
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/file/FileUtils;->SECURITY_ERR:I

    .line 57
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/file/FileUtils;->ABORT_ERR:I

    .line 59
    const/4 v0, 0x4

    sput v0, Lorg/apache/cordova/file/FileUtils;->NOT_READABLE_ERR:I

    .line 60
    const/4 v0, 0x5

    sput v0, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    .line 61
    const/4 v0, 0x6

    sput v0, Lorg/apache/cordova/file/FileUtils;->NO_MODIFICATION_ALLOWED_ERR:I

    .line 62
    const/4 v0, 0x7

    sput v0, Lorg/apache/cordova/file/FileUtils;->INVALID_STATE_ERR:I

    .line 63
    const/16 v0, 0x8

    sput v0, Lorg/apache/cordova/file/FileUtils;->SYNTAX_ERR:I

    .line 64
    const/16 v0, 0x9

    sput v0, Lorg/apache/cordova/file/FileUtils;->INVALID_MODIFICATION_ERR:I

    .line 65
    const/16 v0, 0xa

    sput v0, Lorg/apache/cordova/file/FileUtils;->QUOTA_EXCEEDED_ERR:I

    .line 66
    const/16 v0, 0xb

    sput v0, Lorg/apache/cordova/file/FileUtils;->TYPE_MISMATCH_ERR:I

    .line 67
    const/16 v0, 0xc

    sput v0, Lorg/apache/cordova/file/FileUtils;->PATH_EXISTS_ERR:I

    .line 69
    const/16 v0, 0x3e8

    sput v0, Lorg/apache/cordova/file/FileUtils;->UNKNOWN_ERR:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    .line 76
    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;J)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->truncateFile(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$100(Lorg/apache/cordova/file/FileUtils;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->requestAllFileSystems()Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/file/FileUtils;->transferTo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->readEntries(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/apache/cordova/file/FileUtils;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->requestAllPaths()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/apache/cordova/file/FileUtils;I)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->requestFileSystem(I)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->resolveLocalFileSystemURI(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->getFileMetadata(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->getParent(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lorg/json/JSONObject;
    .param p4, "x4"    # Z
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
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/file/FileUtils;->getFile(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->remove(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/file/FileUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->removeRecursively(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private filesystemForName(Ljava/lang/String;)Lorg/apache/cordova/file/Filesystem;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/file/Filesystem;

    .line 90
    .local v0, "fs":Lorg/apache/cordova/file/Filesystem;
    if-eqz v0, :cond_0

    iget-object v2, v0, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 94
    .end local v0    # "fs":Lorg/apache/cordova/file/Filesystem;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;
    .locals 1
    .param p1, "localURL"    # Lorg/apache/cordova/file/LocalFilesystemURL;

    .prologue
    .line 216
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 217
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->filesystemName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/file/FileUtils;->filesystemForName(Ljava/lang/String;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    goto :goto_0
.end method

.method public static getEntry(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 931
    invoke-static {}, Lorg/apache/cordova/file/FileUtils;->getFilePlugin()Lorg/apache/cordova/file/FileUtils;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 932
    invoke-static {}, Lorg/apache/cordova/file/FileUtils;->getFilePlugin()Lorg/apache/cordova/file/FileUtils;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/cordova/file/FileUtils;->getEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v0

    .line 934
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getFile(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 5
    .param p1, "baseURLstr"    # Ljava/lang/String;
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
    .line 770
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 771
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 772
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 773
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 777
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 778
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 775
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2, p2, p3, p4}, Lorg/apache/cordova/file/Filesystem;->getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3
.end method

.method private getFileMetadata(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "baseURLstr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 817
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 818
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 819
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 820
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 824
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 825
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 822
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3
.end method

.method public static getFilePlugin()Lorg/apache/cordova/file/FileUtils;
    .locals 1

    .prologue
    .line 212
    sget-object v0, Lorg/apache/cordova/file/FileUtils;->filePlugin:Lorg/apache/cordova/file/FileUtils;

    return-object v0
.end method

.method private getParent(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "baseURLstr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 794
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 795
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 796
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 797
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 801
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 802
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 799
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->getParentForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3
.end method

.method private readEntries(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 5
    .param p1, "baseURLstr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 645
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 646
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 647
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 648
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 652
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 653
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 650
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->readEntriesAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3
.end method

.method private remove(Ljava/lang/String;)Z
    .locals 5
    .param p1, "baseURLstr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 736
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 738
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    const-string v3, ""

    iget-object v4, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "/"

    iget-object v4, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 740
    :cond_0
    new-instance v3, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v4, "You can\'t delete the root directory"

    invoke-direct {v3, v4}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 749
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 750
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 743
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_1
    :try_start_1
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 744
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_2

    .line 745
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 747
    :cond_2
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    return v3
.end method

.method private removeRecursively(Ljava/lang/String;)Z
    .locals 5
    .param p1, "baseURLstr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 706
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 708
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    const-string v3, ""

    iget-object v4, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "/"

    iget-object v4, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 709
    :cond_0
    new-instance v3, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v4, "You can\'t delete the root directory"

    invoke-direct {v3, v4}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 718
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 719
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 712
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_1
    :try_start_1
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 713
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_2

    .line 714
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 716
    :cond_2
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    return v3
.end method

.method private requestAllFileSystems()Lorg/json/JSONArray;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 865
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 866
    .local v2, "ret":Lorg/json/JSONArray;
    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/file/Filesystem;

    .line 867
    .local v0, "fs":Lorg/apache/cordova/file/Filesystem;
    new-instance v3, Lorg/apache/cordova/file/LocalFilesystemURL;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cdvfile://localhost/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 868
    .local v3, "rootURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-virtual {v0, v3}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 870
    .end local v0    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v3    # "rootURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    return-object v2
.end method

.method private requestAllPaths()Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 878
    iget-object v3, p0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 879
    .local v0, "context":Landroid/content/Context;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 880
    .local v2, "ret":Lorg/json/JSONObject;
    const-string v3, "applicationDirectory"

    const-string v4, "file:///android_asset/"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 881
    const-string v3, "applicationStorageDirectory"

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 882
    const-string v3, "dataDirectory"

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 883
    const-string v3, "cacheDirectory"

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 884
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mounted"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 886
    :try_start_0
    const-string v3, "externalApplicationStorageDirectory"

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 887
    const-string v3, "externalDataDirectory"

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 888
    const-string v3, "externalCacheDirectory"

    invoke-virtual {v0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 889
    const-string v3, "externalRootDirectory"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 896
    :cond_0
    :goto_0
    return-object v2

    .line 891
    :catch_0
    move-exception v1

    .line 893
    .local v1, "e":Ljava/lang/NullPointerException;
    const-string v3, "FileUtils"

    const-string v4, "Unable to access these paths, most liklely due to USB storage"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private requestFileSystem(I)Lorg/json/JSONObject;
    .locals 6
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 838
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 839
    .local v1, "fs":Lorg/json/JSONObject;
    const/4 v2, 0x0

    .line 841
    .local v2, "rootFs":Lorg/apache/cordova/file/Filesystem;
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lorg/apache/cordova/file/Filesystem;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 845
    :goto_0
    if-nez v2, :cond_0

    .line 846
    new-instance v4, Ljava/io/IOException;

    const-string v5, "No filesystem of type requested"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 848
    :cond_0
    new-instance v3, Lorg/apache/cordova/file/LocalFilesystemURL;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cdvfile://localhost/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 850
    .local v3, "rootURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    const-string v4, "name"

    iget-object v5, v2, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 851
    const-string v4, "root"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 852
    return-object v1

    .line 842
    .end local v3    # "rootURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private resolveLocalFileSystemURI(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 592
    if-nez p1, :cond_0

    .line 593
    new-instance v8, Ljava/net/MalformedURLException;

    const-string v9, "Unrecognized filesystem URL"

    invoke-direct {v8, v9}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 597
    :cond_0
    const-string v8, "file:/"

    invoke-virtual {p1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 598
    const-string v8, "file://"

    invoke-virtual {p1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 599
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "file:///"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x6

    invoke-virtual {p1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 601
    :cond_1
    const-string v8, "UTF-8"

    invoke-static {p1, v8}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 604
    .local v0, "decoded":Ljava/lang/String;
    const-string v8, "?"

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 606
    .local v6, "questionMark":I
    if-gez v6, :cond_3

    .line 607
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    .line 612
    .local v5, "pathEnd":I
    :goto_0
    const-string v8, "/"

    const/4 v9, 0x7

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 613
    .local v7, "thirdSlash":I
    if-ltz v7, :cond_2

    if-le v7, v5, :cond_4

    .line 614
    :cond_2
    const-string v4, ""

    .line 618
    .local v4, "path":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0, v4}, Lorg/apache/cordova/file/FileUtils;->filesystemURLforLocalPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v3

    .line 624
    .end local v0    # "decoded":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "pathEnd":I
    .end local v6    # "questionMark":I
    .end local v7    # "thirdSlash":I
    .local v3, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :goto_2
    :try_start_0
    invoke-direct {p0, v3}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v2

    .line 625
    .local v2, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v2, :cond_6

    .line 626
    new-instance v8, Ljava/net/MalformedURLException;

    const-string v9, "No installed handlers for this URL"

    invoke-direct {v8, v9}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 629
    .end local v2    # "fs":Lorg/apache/cordova/file/Filesystem;
    :catch_0
    move-exception v1

    .line 630
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v8, Ljava/net/MalformedURLException;

    const-string v9, "Unrecognized filesystem URL"

    invoke-direct {v8, v9}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 609
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .end local v3    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .restart local v0    # "decoded":Ljava/lang/String;
    .restart local v6    # "questionMark":I
    :cond_3
    move v5, v6

    .restart local v5    # "pathEnd":I
    goto :goto_0

    .line 616
    .restart local v7    # "thirdSlash":I
    :cond_4
    invoke-virtual {v0, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "path":Ljava/lang/String;
    goto :goto_1

    .line 620
    .end local v0    # "decoded":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "pathEnd":I
    .end local v6    # "questionMark":I
    .end local v7    # "thirdSlash":I
    :cond_5
    new-instance v3, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v3, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .restart local v3    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    goto :goto_2

    .line 628
    .restart local v2    # "fs":Lorg/apache/cordova/file/Filesystem;
    :cond_6
    :try_start_1
    invoke-virtual {v2, v3}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v8

    return-object v8
.end method

.method private threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "f"    # Lorg/apache/cordova/file/FileUtils$FileOp;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 548
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/file/FileUtils$25;

    invoke-direct {v1, p0, p1, p2}, Lorg/apache/cordova/file/FileUtils$25;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 578
    return-void
.end method

.method private static toDirUrl(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .param p0, "f"    # Ljava/io/File;

    .prologue
    .line 874
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private transferTo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 6
    .param p1, "srcURLstr"    # Ljava/lang/String;
    .param p2, "destURLstr"    # Ljava/lang/String;
    .param p3, "newName"    # Ljava/lang/String;
    .param p4, "move"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 673
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 675
    :cond_0
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2}, Ljava/io/FileNotFoundException;-><init>()V

    throw v2

    .line 678
    :cond_1
    new-instance v4, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v4, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 679
    .local v4, "srcURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    new-instance v1, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v1, p2}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 681
    .local v1, "destURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v4}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v3

    .line 682
    .local v3, "srcFs":Lorg/apache/cordova/file/Filesystem;
    invoke-direct {p0, v1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    .line 685
    .local v0, "destFs":Lorg/apache/cordova/file/Filesystem;
    if-eqz p3, :cond_2

    const-string v2, ":"

    invoke-virtual {p3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 686
    new-instance v2, Lorg/apache/cordova/file/EncodingException;

    const-string v5, "Bad file name"

    invoke-direct {v2, v5}, Lorg/apache/cordova/file/EncodingException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_2
    move-object v2, p3

    move v5, p4

    .line 689
    invoke-virtual/range {v0 .. v5}, Lorg/apache/cordova/file/Filesystem;->copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2
.end method

.method private truncateFile(Ljava/lang/String;J)J
    .locals 5
    .param p1, "srcURLstr"    # Ljava/lang/String;
    .param p2, "size"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 1047
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 1048
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 1049
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 1050
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1054
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 1055
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1053
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2, p2, p3}, Lorg/apache/cordova/file/Filesystem;->truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-wide v3

    return-wide v3
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 33
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 247
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    if-nez v3, :cond_0

    .line 248
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "File plugin is not configured. Please see the README.md file for details on how to update config.xml"

    invoke-direct {v3, v4, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 249
    const/4 v3, 0x1

    .line 499
    :goto_0
    return v3

    .line 251
    :cond_0
    const-string v3, "testSaveLocationExists"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 252
    new-instance v3, Lorg/apache/cordova/file/FileUtils$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v1}, Lorg/apache/cordova/file/FileUtils$1;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    .line 499
    :goto_1
    const/4 v3, 0x1

    goto :goto_0

    .line 259
    :cond_1
    const-string v3, "getFreeDiskSpace"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 260
    new-instance v3, Lorg/apache/cordova/file/FileUtils$2;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v1}, Lorg/apache/cordova/file/FileUtils$2;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 267
    :cond_2
    const-string v3, "testFileExists"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 268
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 269
    .local v5, "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$3;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$3;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 276
    .end local v5    # "fname":Ljava/lang/String;
    :cond_3
    const-string v3, "testDirectoryExists"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 277
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 278
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$4;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$4;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 285
    .end local v5    # "fname":Ljava/lang/String;
    :cond_4
    const-string v3, "readAsText"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 286
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 287
    .local v9, "encoding":Ljava/lang/String;
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    .line 288
    .local v6, "start":I
    const/4 v3, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v7

    .line 289
    .local v7, "end":I
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 290
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$5;

    move-object/from16 v4, p0

    move-object/from16 v8, p3

    invoke-direct/range {v3 .. v9}, Lorg/apache/cordova/file/FileUtils$5;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;IILorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 296
    .end local v5    # "fname":Ljava/lang/String;
    .end local v6    # "start":I
    .end local v7    # "end":I
    .end local v9    # "encoding":Ljava/lang/String;
    :cond_5
    const-string v3, "readAsDataURL"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 297
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    .line 298
    .restart local v6    # "start":I
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v7

    .line 299
    .restart local v7    # "end":I
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 300
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$6;

    move-object/from16 v4, p0

    move-object/from16 v8, p3

    invoke-direct/range {v3 .. v8}, Lorg/apache/cordova/file/FileUtils$6;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;IILorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 306
    .end local v5    # "fname":Ljava/lang/String;
    .end local v6    # "start":I
    .end local v7    # "end":I
    :cond_6
    const-string v3, "readAsArrayBuffer"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 307
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    .line 308
    .restart local v6    # "start":I
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v7

    .line 309
    .restart local v7    # "end":I
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 310
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$7;

    move-object/from16 v4, p0

    move-object/from16 v8, p3

    invoke-direct/range {v3 .. v8}, Lorg/apache/cordova/file/FileUtils$7;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;IILorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 316
    .end local v5    # "fname":Ljava/lang/String;
    .end local v6    # "start":I
    .end local v7    # "end":I
    :cond_7
    const-string v3, "readAsBinaryString"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 317
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    .line 318
    .restart local v6    # "start":I
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v7

    .line 319
    .restart local v7    # "end":I
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 320
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$8;

    move-object/from16 v4, p0

    move-object/from16 v8, p3

    invoke-direct/range {v3 .. v8}, Lorg/apache/cordova/file/FileUtils$8;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;IILorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 326
    .end local v5    # "fname":Ljava/lang/String;
    .end local v6    # "start":I
    .end local v7    # "end":I
    :cond_8
    const-string v3, "write"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 327
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 328
    .restart local v5    # "fname":Ljava/lang/String;
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 329
    .local v13, "data":Ljava/lang/String;
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v14

    .line 330
    .local v14, "offset":I
    const/4 v3, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    .line 331
    .local v15, "isBinary":Ljava/lang/Boolean;
    new-instance v10, Lorg/apache/cordova/file/FileUtils$9;

    move-object/from16 v11, p0

    move-object v12, v5

    move-object/from16 v16, p3

    invoke-direct/range {v10 .. v16}, Lorg/apache/cordova/file/FileUtils$9;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Boolean;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v10, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 338
    .end local v5    # "fname":Ljava/lang/String;
    .end local v13    # "data":Ljava/lang/String;
    .end local v14    # "offset":I
    .end local v15    # "isBinary":Ljava/lang/Boolean;
    :cond_9
    const-string v3, "truncate"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 339
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 340
    .restart local v5    # "fname":Ljava/lang/String;
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v14

    .line 341
    .restart local v14    # "offset":I
    new-instance v3, Lorg/apache/cordova/file/FileUtils$10;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v14, v1}, Lorg/apache/cordova/file/FileUtils$10;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 348
    .end local v5    # "fname":Ljava/lang/String;
    .end local v14    # "offset":I
    :cond_a
    const-string v3, "requestAllFileSystems"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 349
    new-instance v3, Lorg/apache/cordova/file/FileUtils$11;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v1}, Lorg/apache/cordova/file/FileUtils$11;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 354
    :cond_b
    const-string v3, "requestAllPaths"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 355
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    new-instance v4, Lorg/apache/cordova/file/FileUtils$12;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v4, v0, v1}, Lorg/apache/cordova/file/FileUtils$12;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 367
    :cond_c
    const-string v3, "requestFileSystem"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 368
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v21

    .line 369
    .local v21, "fstype":I
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optLong(I)J

    move-result-wide v18

    .line 370
    .local v18, "size":J
    new-instance v16, Lorg/apache/cordova/file/FileUtils$13;

    move-object/from16 v17, p0

    move-object/from16 v20, p3

    invoke-direct/range {v16 .. v21}, Lorg/apache/cordova/file/FileUtils$13;-><init>(Lorg/apache/cordova/file/FileUtils;JLorg/apache/cordova/CallbackContext;I)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 381
    .end local v18    # "size":J
    .end local v21    # "fstype":I
    :cond_d
    const-string v3, "resolveLocalFileSystemURI"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 382
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 383
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$14;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$14;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 390
    .end local v5    # "fname":Ljava/lang/String;
    :cond_e
    const-string v3, "getFileMetadata"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 391
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 392
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$15;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$15;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 399
    .end local v5    # "fname":Ljava/lang/String;
    :cond_f
    const-string v3, "getParent"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 400
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 401
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$16;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$16;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 408
    .end local v5    # "fname":Ljava/lang/String;
    :cond_10
    const-string v3, "getDirectory"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 409
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 410
    .local v24, "dirname":Ljava/lang/String;
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v25

    .line 411
    .local v25, "path":Ljava/lang/String;
    new-instance v22, Lorg/apache/cordova/file/FileUtils$17;

    move-object/from16 v23, p0

    move-object/from16 v26, p2

    move-object/from16 v27, p3

    invoke-direct/range {v22 .. v27}, Lorg/apache/cordova/file/FileUtils$17;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 418
    .end local v24    # "dirname":Ljava/lang/String;
    .end local v25    # "path":Ljava/lang/String;
    :cond_11
    const-string v3, "getFile"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 419
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 420
    .restart local v24    # "dirname":Ljava/lang/String;
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v25

    .line 421
    .restart local v25    # "path":Ljava/lang/String;
    new-instance v22, Lorg/apache/cordova/file/FileUtils$18;

    move-object/from16 v23, p0

    move-object/from16 v26, p2

    move-object/from16 v27, p3

    invoke-direct/range {v22 .. v27}, Lorg/apache/cordova/file/FileUtils$18;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 428
    .end local v24    # "dirname":Ljava/lang/String;
    .end local v25    # "path":Ljava/lang/String;
    :cond_12
    const-string v3, "remove"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 429
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 430
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$19;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$19;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 441
    .end local v5    # "fname":Ljava/lang/String;
    :cond_13
    const-string v3, "removeRecursively"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 442
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 443
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$20;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$20;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 454
    .end local v5    # "fname":Ljava/lang/String;
    :cond_14
    const-string v3, "moveTo"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 455
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 456
    .restart local v5    # "fname":Ljava/lang/String;
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v29

    .line 457
    .local v29, "newParent":Ljava/lang/String;
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v30

    .line 458
    .local v30, "newName":Ljava/lang/String;
    new-instance v26, Lorg/apache/cordova/file/FileUtils$21;

    move-object/from16 v27, p0

    move-object/from16 v28, v5

    move-object/from16 v31, p3

    invoke-direct/range {v26 .. v31}, Lorg/apache/cordova/file/FileUtils$21;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 465
    .end local v5    # "fname":Ljava/lang/String;
    .end local v29    # "newParent":Ljava/lang/String;
    .end local v30    # "newName":Ljava/lang/String;
    :cond_15
    const-string v3, "copyTo"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 466
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 467
    .restart local v5    # "fname":Ljava/lang/String;
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v29

    .line 468
    .restart local v29    # "newParent":Ljava/lang/String;
    const/4 v3, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v30

    .line 469
    .restart local v30    # "newName":Ljava/lang/String;
    new-instance v26, Lorg/apache/cordova/file/FileUtils$22;

    move-object/from16 v27, p0

    move-object/from16 v28, v5

    move-object/from16 v31, p3

    invoke-direct/range {v26 .. v31}, Lorg/apache/cordova/file/FileUtils$22;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 476
    .end local v5    # "fname":Ljava/lang/String;
    .end local v29    # "newParent":Ljava/lang/String;
    .end local v30    # "newName":Ljava/lang/String;
    :cond_16
    const-string v3, "readEntries"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 477
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 478
    .restart local v5    # "fname":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$23;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v5, v1}, Lorg/apache/cordova/file/FileUtils$23;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 485
    .end local v5    # "fname":Ljava/lang/String;
    :cond_17
    const-string v3, "_getLocalFilesystemPath"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 488
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v32

    .line 489
    .local v32, "localURLstr":Ljava/lang/String;
    new-instance v3, Lorg/apache/cordova/file/FileUtils$24;

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, p3

    invoke-direct {v3, v0, v1, v2}, Lorg/apache/cordova/file/FileUtils$24;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 497
    .end local v32    # "localURLstr":Ljava/lang/String;
    :cond_18
    const/4 v3, 0x0

    goto/16 :goto_0
.end method

.method public filesystemPathForURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "localURLstr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 510
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 511
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 512
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 513
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "No installed handlers for this URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 516
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 517
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/net/MalformedURLException;

    const-string v4, "Unrecognized filesystem URL"

    invoke-direct {v3, v4}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 515
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3
.end method

.method public filesystemURLforLocalPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 6
    .param p1, "localPath"    # Ljava/lang/String;

    .prologue
    .line 522
    const/4 v2, 0x0

    .line 523
    .local v2, "localURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    const/4 v3, 0x0

    .line 527
    .local v3, "shortestFullPath":I
    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/file/Filesystem;

    .line 528
    .local v0, "fs":Lorg/apache/cordova/file/Filesystem;
    if-eqz v0, :cond_0

    .line 529
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v4

    .line 530
    .local v4, "url":Lorg/apache/cordova/file/LocalFilesystemURL;
    if-eqz v4, :cond_0

    .line 533
    if-eqz v2, :cond_1

    iget-object v5, v4, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v5, v3, :cond_0

    .line 534
    :cond_1
    move-object v2, v4

    .line 535
    iget-object v5, v4, Lorg/apache/cordova/file/LocalFilesystemURL;->fullPath:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_0

    .line 540
    .end local v0    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v4    # "url":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_2
    return-object v2
.end method

.method protected getAvailableFileSystems(Landroid/app/Activity;)Ljava/util/HashMap;
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 129
    .local v1, "context":Landroid/content/Context;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 131
    .local v0, "availableFileSystems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "files"

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string v3, "documents"

    new-instance v4, Ljava/io/File;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    const-string v6, "Documents"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    const-string v3, "cache"

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v3, "root"

    const-string v4, "/"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mounted"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 137
    :try_start_0
    const-string v3, "files-external"

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-string v3, "sdcard"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v3, "cache-external"

    invoke-virtual {v1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :cond_0
    :goto_0
    return-object v0

    .line 141
    :catch_0
    move-exception v2

    .line 142
    .local v2, "e":Ljava/lang/NullPointerException;
    const-string v3, "FileUtils"

    const-string v4, "External storage unavailable, check to see if USB Mass Storage Mode is on"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 910
    iget-object v3, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/file/Filesystem;

    .line 911
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    invoke-virtual {v1, p1}, Lorg/apache/cordova/file/Filesystem;->makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v0

    .line 912
    .local v0, "entry":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 916
    .end local v0    # "entry":Lorg/json/JSONObject;
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getExtraFileSystemsPreference(Landroid/app/Activity;)[Ljava/lang/String;
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 98
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "androidextrafilesystems"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "fileSystemsStr":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 100
    const-string v0, "files,files-external,documents,sdcard,cache,cache-external,root"

    .line 102
    :cond_0
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 8
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    const/4 v7, 0x1

    .line 151
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 152
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    .line 154
    const/4 v4, 0x0

    .line 155
    .local v4, "tempRoot":Ljava/lang/String;
    const/4 v3, 0x0

    .line 157
    .local v3, "persistentRoot":Ljava/lang/String;
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 158
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 160
    .local v2, "packageName":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "androidpersistentfilelocation"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 161
    .local v1, "location":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 162
    const-string v1, "compatibility"

    .line 164
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 165
    const-string v5, "internal"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 166
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/files/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 167
    iput-boolean v7, p0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    .line 186
    :cond_1
    :goto_0
    iget-boolean v5, p0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    if-eqz v5, :cond_5

    .line 188
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 189
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 195
    new-instance v5, Lorg/apache/cordova/file/LocalFilesystem;

    const-string v6, "temporary"

    invoke-direct {v5, v6, p1, v4}, Lorg/apache/cordova/file/LocalFilesystem;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 196
    new-instance v5, Lorg/apache/cordova/file/LocalFilesystem;

    const-string v6, "persistent"

    invoke-direct {v5, v6, p1, v3}, Lorg/apache/cordova/file/LocalFilesystem;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 197
    new-instance v5, Lorg/apache/cordova/file/ContentFilesystem;

    const-string v6, "content"

    invoke-direct {v5, v6, p1, p2}, Lorg/apache/cordova/file/ContentFilesystem;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {p0, v5}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 199
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/FileUtils;->getExtraFileSystemsPreference(Landroid/app/Activity;)[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/FileUtils;->getAvailableFileSystems(Landroid/app/Activity;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/cordova/file/FileUtils;->registerExtraFileSystems([Ljava/lang/String;Ljava/util/HashMap;)V

    .line 202
    sget-object v5, Lorg/apache/cordova/file/FileUtils;->filePlugin:Lorg/apache/cordova/file/FileUtils;

    if-nez v5, :cond_2

    .line 203
    sput-object p0, Lorg/apache/cordova/file/FileUtils;->filePlugin:Lorg/apache/cordova/file/FileUtils;

    .line 209
    :cond_2
    :goto_1
    return-void

    .line 168
    :cond_3
    const-string v5, "compatibility"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 176
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v5

    const-string v6, "mounted"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 177
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 178
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/Android/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/cache/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 183
    :goto_2
    iput-boolean v7, p0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    goto/16 :goto_0

    .line 181
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 206
    :cond_5
    const-string v5, "FileUtils"

    const-string v6, "File plugin configuration error: Please set AndroidPersistentFileLocation in config.xml to one of \"internal\" (for new applications) or \"compatibility\" (for compatibility with previous versions)"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_1
.end method

.method public readFileAs(Ljava/lang/String;IILorg/apache/cordova/CallbackContext;Ljava/lang/String;I)V
    .locals 8
    .param p1, "srcURLstr"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p5, "encoding"    # Ljava/lang/String;
    .param p6, "resultType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 952
    :try_start_0
    new-instance v1, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v1, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 953
    .local v1, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    .line 954
    .local v0, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v0, :cond_0

    .line 955
    new-instance v2, Ljava/net/MalformedURLException;

    const-string v3, "No installed handlers for this URL"

    invoke-direct {v2, v3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 1000
    .end local v0    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v1    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v7

    .line 1001
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/net/MalformedURLException;

    const-string v3, "Unrecognized filesystem URL"

    invoke-direct {v2, v3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 958
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v1    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    int-to-long v2, p2

    int-to-long v4, p3

    :try_start_1
    new-instance v6, Lorg/apache/cordova/file/FileUtils$26;

    invoke-direct {v6, p0, p6, p5, p4}, Lorg/apache/cordova/file/FileUtils$26;-><init>(Lorg/apache/cordova/file/FileUtils;ILjava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual/range {v0 .. v6}, Lorg/apache/cordova/file/Filesystem;->readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 1008
    .end local v0    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v1    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :goto_0
    return-void

    .line 1002
    :catch_1
    move-exception v7

    .line 1003
    .local v7, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    sget v4, Lorg/apache/cordova/file/FileUtils;->NOT_FOUND_ERR:I

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p4, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 1004
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v7

    .line 1005
    .local v7, "e":Ljava/io/IOException;
    const-string v2, "FileUtils"

    invoke-virtual {v7}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1006
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    sget v4, Lorg/apache/cordova/file/FileUtils;->NOT_READABLE_ERR:I

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p4, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method protected registerExtraFileSystems([Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 10
    .param p1, "filesystems"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p2, "availableFileSystems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 109
    .local v4, "installedFileSystems":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_4

    aget-object v1, v0, v3

    .line 110
    .local v1, "fsName":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 111
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 112
    .local v2, "fsRoot":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 113
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 114
    .local v6, "newRoot":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 115
    :cond_0
    new-instance v7, Lorg/apache/cordova/file/LocalFilesystem;

    iget-object v8, p0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-direct {v7, v1, v8, v2}, Lorg/apache/cordova/file/LocalFilesystem;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 116
    invoke-virtual {v4, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 109
    .end local v2    # "fsRoot":Ljava/lang/String;
    .end local v6    # "newRoot":Ljava/io/File;
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 118
    .restart local v2    # "fsRoot":Ljava/lang/String;
    .restart local v6    # "newRoot":Ljava/io/File;
    :cond_2
    const-string v7, "FileUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to create root dir for fileystem \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\", skipping"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 121
    .end local v6    # "newRoot":Ljava/io/File;
    :cond_3
    const-string v7, "FileUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unrecognized extra filesystem identifier: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 125
    .end local v1    # "fsName":Ljava/lang/String;
    .end local v2    # "fsRoot":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method public registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/cordova/file/Filesystem;

    .prologue
    .line 83
    if-eqz p1, :cond_0

    iget-object v0, p1, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/file/FileUtils;->filesystemForName(Ljava/lang/String;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-nez v0, :cond_0

    .line 84
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    :cond_0
    return-void
.end method

.method public remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v4, 0x0

    .line 223
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Landroid/net/Uri;)V

    .line 224
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 225
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_1

    .line 234
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :goto_0
    return-object v4

    .line 228
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_1
    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v3

    .line 229
    .local v3, "path":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 230
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file:///"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_0

    .line 233
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    .end local v3    # "path":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    goto :goto_0
.end method

.method public write(Ljava/lang/String;Ljava/lang/String;IZ)J
    .locals 8
    .param p1, "srcURLstr"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "isBinary"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 1024
    :try_start_0
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystemURL;

    invoke-direct {v2, p1}, Lorg/apache/cordova/file/LocalFilesystemURL;-><init>(Ljava/lang/String;)V

    .line 1025
    .local v2, "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    invoke-direct {p0, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    .line 1026
    .local v1, "fs":Lorg/apache/cordova/file/Filesystem;
    if-nez v1, :cond_0

    .line 1027
    new-instance v5, Ljava/net/MalformedURLException;

    const-string v6, "No installed handlers for this URL"

    invoke-direct {v5, v6}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1031
    .end local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .end local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :catch_0
    move-exception v0

    .line 1032
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v5, Ljava/net/MalformedURLException;

    const-string v6, "Unrecognized filesystem URL"

    invoke-direct {v5, v6}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1030
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "fs":Lorg/apache/cordova/file/Filesystem;
    .restart local v2    # "inputURL":Lorg/apache/cordova/file/LocalFilesystemURL;
    :cond_0
    :try_start_1
    invoke-virtual {v1, v2, p2, p3, p4}, Lorg/apache/cordova/file/Filesystem;->writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J

    move-result-wide v3

    .local v3, "x":J
    const-string v5, "TEST"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    return-wide v3
.end method

.class Lorg/apache/cordova/file/FileUtils$24;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Lorg/apache/cordova/file/FileUtils$FileOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$localURLstr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 489
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$24;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$24;->val$localURLstr:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 491
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$24;->val$localURLstr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/cordova/file/FileUtils;->filesystemPathForURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 492
    .local v0, "fname":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$24;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 493
    return-void
.end method

.class Lorg/apache/cordova/file/FileUtils$13;
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

.field final synthetic val$fstype:I

.field final synthetic val$size:J


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;JLorg/apache/cordova/CallbackContext;I)V
    .locals 0

    .prologue
    .line 370
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$13;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-wide p2, p0, Lorg/apache/cordova/file/FileUtils$13;->val$size:J

    iput-object p4, p0, Lorg/apache/cordova/file/FileUtils$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput p5, p0, Lorg/apache/cordova/file/FileUtils$13;->val$fstype:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 372
    iget-wide v1, p0, Lorg/apache/cordova/file/FileUtils$13;->val$size:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lorg/apache/cordova/file/FileUtils$13;->val$size:J

    const/4 v3, 0x1

    invoke-static {v3}, Lorg/apache/cordova/file/DirectoryManager;->getFreeDiskSpace(Z)J

    move-result-wide v3

    const-wide/16 v5, 0x400

    mul-long/2addr v3, v5

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 373
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v4, Lorg/apache/cordova/file/FileUtils;->QUOTA_EXCEEDED_ERR:I

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 378
    :goto_0
    return-void

    .line 375
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$13;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget v2, p0, Lorg/apache/cordova/file/FileUtils$13;->val$fstype:I

    # invokes: Lorg/apache/cordova/file/FileUtils;->requestFileSystem(I)Lorg/json/JSONObject;
    invoke-static {v1, v2}, Lorg/apache/cordova/file/FileUtils;->access$300(Lorg/apache/cordova/file/FileUtils;I)Lorg/json/JSONObject;

    move-result-object v0

    .line 376
    .local v0, "obj":Lorg/json/JSONObject;
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_0
.end method

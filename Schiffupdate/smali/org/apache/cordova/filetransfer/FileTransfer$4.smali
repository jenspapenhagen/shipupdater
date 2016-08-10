.class Lorg/apache/cordova/filetransfer/FileTransfer$4;
.super Ljava/lang/Object;
.source "FileTransfer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/filetransfer/FileTransfer;->download(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

.field final synthetic val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

.field final synthetic val$headers:Lorg/json/JSONObject;

.field final synthetic val$isLocalTransfer:Z

.field final synthetic val$objectId:Ljava/lang/String;

.field final synthetic val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

.field final synthetic val$source:Ljava/lang/String;

.field final synthetic val$sourceUri:Landroid/net/Uri;

.field final synthetic val$target:Ljava/lang/String;

.field final synthetic val$targetUri:Landroid/net/Uri;

.field final synthetic val$trustEveryone:Z

.field final synthetic val$useHttps:Z


# direct methods
.method constructor <init>(Lorg/apache/cordova/filetransfer/FileTransfer;Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;Lorg/apache/cordova/CordovaResourceApi;Landroid/net/Uri;Landroid/net/Uri;ZZZLorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 697
    iput-object p1, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    iput-object p2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iput-object p3, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iput-object p4, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$targetUri:Landroid/net/Uri;

    iput-object p5, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$sourceUri:Landroid/net/Uri;

    iput-boolean p6, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$isLocalTransfer:Z

    iput-boolean p7, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    iput-boolean p8, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    iput-object p9, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$headers:Lorg/json/JSONObject;

    iput-object p10, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    iput-object p11, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    iput-object p12, p0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 28

    .prologue
    .line 699
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v23, v0

    if-eqz v23, :cond_0

    .line 854
    :goto_0
    return-void

    .line 702
    :cond_0
    const/4 v5, 0x0

    .line 703
    .local v5, "connection":Ljava/net/HttpURLConnection;
    const/4 v15, 0x0

    .line 704
    .local v15, "oldHostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    const/16 v16, 0x0

    .line 705
    .local v16, "oldSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/4 v9, 0x0

    .line 706
    .local v9, "file":Ljava/io/File;
    const/16 v21, 0x0

    .line 707
    .local v21, "result":Lorg/apache/cordova/PluginResult;
    const/4 v13, 0x0

    .line 709
    .local v13, "inputStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    const/16 v17, 0x0

    .line 711
    .local v17, "outputStream":Ljava/io/OutputStream;
    const/16 v20, 0x0

    .line 712
    .local v20, "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$targetUri:Landroid/net/Uri;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lorg/apache/cordova/CordovaResourceApi;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v17

    .line 714
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$targetUri:Landroid/net/Uri;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lorg/apache/cordova/CordovaResourceApi;->mapUriToFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v9

    .line 715
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iput-object v9, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->targetFile:Ljava/io/File;

    .line 717
    const-string v23, "FileTransfer"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Download file:"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$sourceUri:Landroid/net/Uri;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    new-instance v18, Lorg/apache/cordova/filetransfer/FileProgressResult;

    invoke-direct/range {v18 .. v18}, Lorg/apache/cordova/filetransfer/FileProgressResult;-><init>()V

    .line 721
    .local v18, "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$isLocalTransfer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_5

    .line 722
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$sourceUri:Landroid/net/Uri;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v20

    .line 723
    move-object/from16 v0, v20

    iget-wide v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    move-wide/from16 v23, v0

    const-wide/16 v25, -0x1

    cmp-long v23, v23, v25

    if-eqz v23, :cond_1

    .line 724
    const/16 v23, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLengthComputable(Z)V

    .line 725
    move-object/from16 v0, v20

    iget-wide v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    move-wide/from16 v23, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setTotal(J)V

    .line 727
    :cond_1
    new-instance v14, Lorg/apache/cordova/filetransfer/FileTransfer$SimpleTrackingInputStream;

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-direct {v14, v0}, Lorg/apache/cordova/filetransfer/FileTransfer$SimpleTrackingInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .end local v13    # "inputStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .local v14, "inputStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    move-object v13, v14

    .line 773
    .end local v14    # "inputStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v13    # "inputStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v24, v0

    monitor-enter v24
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 774
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v23, v0

    if-eqz v23, :cond_b

    .line 775
    monitor-exit v24
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 792
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 793
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static {v13}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 794
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 831
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_4
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_8

    .line 836
    if-eqz v5, :cond_2

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_2

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .local v12, "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_2
    if-nez v21, :cond_3

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v24, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v26, v0

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :cond_3
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v23

    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_4

    if-eqz v9, :cond_4

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    .end local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    :goto_2
    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 731
    .restart local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    :cond_5
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$sourceUri:Landroid/net/Uri;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lorg/apache/cordova/CordovaResourceApi;->createHttpConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;

    move-result-object v5

    .line 732
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_6

    .line 734
    move-object v0, v5

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v12, v0

    .line 735
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->trustAllHosts(Ljavax/net/ssl/HttpsURLConnection;)Ljavax/net/ssl/SSLSocketFactory;
    invoke-static {v12}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$000(Ljavax/net/ssl/HttpsURLConnection;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v16

    .line 737
    invoke-virtual {v12}, Ljavax/net/ssl/HttpsURLConnection;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v15

    .line 739
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$100()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 742
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_6
    const-string v23, "GET"

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 745
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$sourceUri:Landroid/net/Uri;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 746
    .local v6, "cookie":Ljava/lang/String;
    if-eqz v6, :cond_7

    .line 748
    const-string v23, "cookie"

    move-object/from16 v0, v23

    invoke-virtual {v5, v0, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    :cond_7
    const-string v23, "Accept-Encoding"

    const-string v24, "gzip"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v5, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 755
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v23, v0

    if-eqz v23, :cond_8

    .line 756
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->addHeadersToRequest(Ljava/net/URLConnection;Lorg/json/JSONObject;)V
    invoke-static {v5, v0}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$200(Ljava/net/URLConnection;Lorg/json/JSONObject;)V

    .line 759
    :cond_8
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->connect()V

    .line 761
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v23

    if-eqz v23, :cond_9

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v23

    const-string v24, "gzip"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_a

    .line 764
    :cond_9
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v23

    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_a

    .line 765
    const/16 v23, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLengthComputable(Z)V

    .line 766
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setTotal(J)V

    .line 769
    :cond_a
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->getInputStream(Ljava/net/URLConnection;)Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    invoke-static {v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$400(Ljava/net/URLConnection;)Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result-object v13

    goto/16 :goto_1

    .line 777
    .end local v6    # "cookie":Ljava/lang/String;
    :cond_b
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iput-object v13, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 778
    monitor-exit v24
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 781
    const/16 v23, 0x4000

    :try_start_7
    move/from16 v0, v23

    new-array v3, v0, [B

    .line 782
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 783
    .local v4, "bytesRead":I
    :goto_3
    invoke-virtual {v13, v3}, Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;->read([B)I

    move-result v4

    if-lez v4, :cond_e

    .line 784
    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-virtual {v0, v3, v1, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 786
    invoke-virtual {v13}, Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;->getTotalRawBytesRead()J

    move-result-wide v23

    move-object/from16 v0, v18

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLoaded(J)V

    .line 787
    new-instance v19, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v18 .. v18}, Lorg/apache/cordova/filetransfer/FileProgressResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 788
    .local v19, "progressResult":Lorg/apache/cordova/PluginResult;
    const/16 v23, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 789
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    .line 792
    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v19    # "progressResult":Lorg/apache/cordova/PluginResult;
    :catchall_0
    move-exception v23

    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 793
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static {v13}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 794
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 792
    throw v23
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 815
    .end local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    :catch_0
    move-exception v7

    .line 816
    .local v7, "e":Ljava/io/FileNotFoundException;
    :try_start_9
    sget v23, Lorg/apache/cordova/filetransfer/FileTransfer;->FILE_NOT_FOUND_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v25, v0

    move/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 817
    .local v8, "error":Lorg/json/JSONObject;
    const-string v23, "FileTransfer"

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 818
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 831
    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .local v22, "result":Lorg/apache/cordova/PluginResult;
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_a
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 836
    if-eqz v5, :cond_c

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_c

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_c
    if-nez v22, :cond_20

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v24, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v26, v0

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :goto_4
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v23

    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_d

    if-eqz v9, :cond_d

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    goto/16 :goto_2

    .line 778
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "error":Lorg/json/JSONObject;
    .restart local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    :catchall_1
    move-exception v23

    :try_start_b
    monitor-exit v24
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :try_start_c
    throw v23
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 792
    .restart local v3    # "buffer":[B
    .restart local v4    # "bytesRead":I
    :cond_e
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 793
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static {v13}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 794
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 797
    const-string v23, "FileTransfer"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Saved file: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 800
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer;->webView:Lorg/apache/cordova/CordovaWebView;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    move-object/from16 v23, v0

    const-string v24, "File"

    invoke-virtual/range {v23 .. v24}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v11

    check-cast v11, Lorg/apache/cordova/file/FileUtils;

    .line 801
    .local v11, "filePlugin":Lorg/apache/cordova/file/FileUtils;
    if-eqz v11, :cond_13

    .line 802
    invoke-virtual {v11, v9}, Lorg/apache/cordova/file/FileUtils;->getEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v10

    .line 803
    .local v10, "fileEntry":Lorg/json/JSONObject;
    if-eqz v10, :cond_12

    .line 804
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_d
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_d} :catch_0
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_1
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v21, v22

    .line 831
    .end local v10    # "fileEntry":Lorg/json/JSONObject;
    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :goto_5
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_e
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    .line 836
    if-eqz v5, :cond_f

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_f

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_f
    if-nez v21, :cond_10

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v24, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v26, v0

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :cond_10
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v23

    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_11

    if-eqz v9, :cond_11

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    goto/16 :goto_2

    .line 806
    .restart local v10    # "fileEntry":Lorg/json/JSONObject;
    :cond_12
    :try_start_f
    sget v23, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v25, v0

    move/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 807
    .restart local v8    # "error":Lorg/json/JSONObject;
    const-string v23, "FileTransfer"

    const-string v24, "File plugin cannot represent download path"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 808
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v21, v22

    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_5

    .line 811
    .end local v8    # "error":Lorg/json/JSONObject;
    .end local v10    # "fileEntry":Lorg/json/JSONObject;
    :cond_13
    const-string v23, "FileTransfer"

    const-string v24, "File plugin not found; cannot save downloaded file"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 812
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v24, "File plugin not found; cannot save downloaded file"

    invoke-direct/range {v22 .. v24}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/io/FileNotFoundException; {:try_start_f .. :try_end_f} :catch_0
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_1
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v21, v22

    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_5

    .line 819
    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v11    # "filePlugin":Lorg/apache/cordova/file/FileUtils;
    .end local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    :catch_1
    move-exception v7

    .line 820
    .local v7, "e":Ljava/io/IOException;
    :try_start_10
    sget v23, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v25, v0

    move/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 821
    .restart local v8    # "error":Lorg/json/JSONObject;
    const-string v23, "FileTransfer"

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 822
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 831
    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_11
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 836
    if-eqz v5, :cond_14

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_14

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_14

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_14
    if-nez v22, :cond_1f

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v24, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v26, v0

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :goto_6
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v23

    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_15

    if-eqz v9, :cond_15

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    goto/16 :goto_2

    .line 823
    .end local v7    # "e":Ljava/io/IOException;
    .end local v8    # "error":Lorg/json/JSONObject;
    :catch_2
    move-exception v7

    .line 824
    .local v7, "e":Lorg/json/JSONException;
    :try_start_12
    const-string v23, "FileTransfer"

    invoke-virtual {v7}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 825
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v22 .. v23}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 831
    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_13
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    .line 836
    if-eqz v5, :cond_16

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_16

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_16

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_16
    if-nez v22, :cond_1e

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v24, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v26, v0

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :goto_7
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v23

    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_17

    if-eqz v9, :cond_17

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    goto/16 :goto_2

    .line 826
    .end local v7    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v7

    .line 827
    .local v7, "e":Ljava/lang/Throwable;
    :try_start_14
    sget v23, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v25, v0

    move/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 828
    .restart local v8    # "error":Lorg/json/JSONObject;
    const-string v23, "FileTransfer"

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 829
    new-instance v22, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    .line 831
    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_15
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    .line 836
    if-eqz v5, :cond_18

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v23, v0

    if-eqz v23, :cond_18

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v23, v0

    if-eqz v23, :cond_18

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_18
    if-nez v22, :cond_1d

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    sget-object v23, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v24, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v26, v0

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :goto_8
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v23

    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_19

    if-eqz v9, :cond_19

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v23, v0

    goto/16 :goto_2

    .line 831
    .end local v7    # "e":Ljava/lang/Throwable;
    .end local v8    # "error":Lorg/json/JSONObject;
    :catchall_2
    move-exception v23

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->safeClose(Ljava/io/Closeable;)V
    invoke-static/range {v17 .. v17}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$300(Ljava/io/Closeable;)V

    .line 832
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v24

    monitor-enter v24

    .line 833
    :try_start_16
    # getter for: Lorg/apache/cordova/filetransfer/FileTransfer;->activeRequests:Ljava/util/HashMap;
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$600()Ljava/util/HashMap;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    monitor-exit v24
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    .line 836
    if-eqz v5, :cond_1a

    .line 838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$useHttps:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1a

    move-object v12, v5

    .line 839
    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    .line 840
    .restart local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v12, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 841
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 845
    .end local v12    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_1a
    if-nez v21, :cond_1b

    .line 846
    new-instance v21, Lorg/apache/cordova/PluginResult;

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v24, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v25, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v27, v0

    move/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    # invokes: Lorg/apache/cordova/filetransfer/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;
    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$500(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v25

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 849
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1b
    invoke-virtual/range {v21 .. v21}, Lorg/apache/cordova/PluginResult;->getStatus()I

    move-result v24

    sget-object v25, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v25 .. v25}, Lorg/apache/cordova/PluginResult$Status;->ordinal()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_1c

    if-eqz v9, :cond_1c

    .line 850
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 852
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$4;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 831
    throw v23

    .line 834
    :catchall_3
    move-exception v23

    :try_start_17
    monitor-exit v24
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    throw v23

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .local v7, "e":Ljava/io/FileNotFoundException;
    .restart local v8    # "error":Lorg/json/JSONObject;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    :catchall_4
    move-exception v23

    :try_start_18
    monitor-exit v24
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    throw v23

    .local v7, "e":Ljava/io/IOException;
    :catchall_5
    move-exception v23

    :try_start_19
    monitor-exit v24
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_5

    throw v23

    .end local v8    # "error":Lorg/json/JSONObject;
    .local v7, "e":Lorg/json/JSONException;
    :catchall_6
    move-exception v23

    :try_start_1a
    monitor-exit v24
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_6

    throw v23

    .local v7, "e":Ljava/lang/Throwable;
    .restart local v8    # "error":Lorg/json/JSONObject;
    :catchall_7
    move-exception v23

    :try_start_1b
    monitor-exit v24
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_7

    throw v23

    .end local v7    # "e":Ljava/lang/Throwable;
    .end local v8    # "error":Lorg/json/JSONObject;
    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    :catchall_8
    move-exception v23

    :try_start_1c
    monitor-exit v24
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_8

    throw v23

    .restart local v3    # "buffer":[B
    .restart local v4    # "bytesRead":I
    .restart local v11    # "filePlugin":Lorg/apache/cordova/file/FileUtils;
    :catchall_9
    move-exception v23

    :try_start_1d
    monitor-exit v24
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_9

    throw v23

    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v11    # "filePlugin":Lorg/apache/cordova/file/FileUtils;
    .end local v18    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v7    # "e":Ljava/lang/Throwable;
    .restart local v8    # "error":Lorg/json/JSONObject;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1d
    move-object/from16 v21, v22

    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_8

    .end local v8    # "error":Lorg/json/JSONObject;
    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .local v7, "e":Lorg/json/JSONException;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1e
    move-object/from16 v21, v22

    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_7

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .local v7, "e":Ljava/io/IOException;
    .restart local v8    # "error":Lorg/json/JSONObject;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1f
    move-object/from16 v21, v22

    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_6

    .end local v21    # "result":Lorg/apache/cordova/PluginResult;
    .local v7, "e":Ljava/io/FileNotFoundException;
    .restart local v22    # "result":Lorg/apache/cordova/PluginResult;
    :cond_20
    move-object/from16 v21, v22

    .end local v22    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v21    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_4
.end method

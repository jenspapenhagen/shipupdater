.class public Lorg/apache/cordova/CordovaWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "CordovaWebViewClient.java"


# static fields
.field private static final CORDOVA_EXEC_URL_PREFIX:Ljava/lang/String; = "http://cdv_exec/"

.field private static final TAG:Ljava/lang/String; = "CordovaWebViewClient"


# instance fields
.field appView:Lorg/apache/cordova/CordovaWebView;

.field private authenticationTokens:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/AuthenticationToken;",
            ">;"
        }
    .end annotation
.end field

.field cordova:Lorg/apache/cordova/CordovaInterface;

.field private doClearHistory:Z

.field helper:Lorg/apache/cordova/CordovaUriHelper;

.field isCurrentlyLoading:Z


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CordovaInterface;)V
    .locals 1
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;

    .prologue
    .line 76
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->doClearHistory:Z

    .line 69
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    .line 77
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewClient;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 1
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "view"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 86
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->doClearHistory:Z

    .line 69
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    .line 87
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewClient;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 88
    iput-object p2, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    .line 89
    new-instance v0, Lorg/apache/cordova/CordovaUriHelper;

    invoke-direct {v0, p1, p2}, Lorg/apache/cordova/CordovaUriHelper;-><init>(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->helper:Lorg/apache/cordova/CordovaUriHelper;

    .line 90
    return-void
.end method

.method private handleExecUrl(Ljava/lang/String;)V
    .locals 11
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x23

    const/4 v9, -0x1

    .line 106
    const-string v8, "http://cdv_exec/"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v2

    .line 107
    .local v2, "idx1":I
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 108
    .local v3, "idx2":I
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 109
    .local v4, "idx3":I
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 110
    .local v5, "idx4":I
    if-eq v2, v9, :cond_0

    if-eq v3, v9, :cond_0

    if-eq v4, v9, :cond_0

    if-ne v5, v9, :cond_1

    .line 111
    :cond_0
    const-string v8, "CordovaWebViewClient"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not decode URL command: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    :goto_0
    return-void

    .line 114
    :cond_1
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 115
    .local v7, "service":Ljava/lang/String;
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {p1, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "action":Ljava/lang/String;
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "callbackId":Ljava/lang/String;
    add-int/lit8 v8, v5, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 118
    .local v6, "jsonArgs":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v8, v8, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v8, v7, v0, v1, v6}, Lorg/apache/cordova/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public clearAuthenticationTokens()V
    .locals 1

    .prologue
    .line 390
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 391
    return-void
.end method

.method public getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;

    .prologue
    .line 365
    const/4 v0, 0x0

    .line 366
    .local v0, "token":Lorg/apache/cordova/AuthenticationToken;
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 368
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    if-nez v0, :cond_1

    .line 370
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 373
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    if-nez v0, :cond_0

    .line 374
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {v1, p2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 378
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    :cond_0
    if-nez v0, :cond_1

    .line 379
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    .line 383
    .restart local v0    # "token":Lorg/apache/cordova/AuthenticationToken;
    :cond_1
    return-object v0
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 193
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 195
    iget-boolean v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->isCurrentlyLoading:Z

    if-nez v1, :cond_1

    .line 240
    :cond_0
    :goto_0
    return-void

    .line 198
    :cond_1
    iput-boolean v4, p0, Lorg/apache/cordova/CordovaWebViewClient;->isCurrentlyLoading:Z

    .line 199
    const-string v1, "CordovaWebViewClient"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPageFinished("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    iget-boolean v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->doClearHistory:Z

    if-eqz v1, :cond_2

    .line 208
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 209
    iput-boolean v4, p0, Lorg/apache/cordova/CordovaWebViewClient;->doClearHistory:Z

    .line 213
    :cond_2
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    iget v2, v1, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 216
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v2, "onPageFinished"

    invoke-virtual {v1, v2, p2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 219
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1}, Lorg/apache/cordova/CordovaWebView;->getVisibility()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 220
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/apache/cordova/CordovaWebViewClient$1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CordovaWebViewClient$1;-><init>(Lorg/apache/cordova/CordovaWebViewClient;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 233
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 237
    .end local v0    # "t":Ljava/lang/Thread;
    :cond_3
    const-string v1, "about:blank"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 238
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v2, "exit"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 168
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 169
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->isCurrentlyLoading:Z

    .line 170
    const-string v0, "CordovaWebViewClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageStarted("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->reset()V

    .line 175
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "onPageStarted"

    invoke-virtual {v0, v1, p2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v0}, Lorg/apache/cordova/PluginManager;->onReset()V

    .line 181
    :cond_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 254
    iget-boolean v2, p0, Lorg/apache/cordova/CordovaWebViewClient;->isCurrentlyLoading:Z

    if-nez v2, :cond_0

    .line 284
    :goto_0
    return-void

    .line 257
    :cond_0
    const-string v2, "CordovaWebViewClient"

    const-string v3, "CordovaWebViewClient.onReceivedError: Error code=%s Description=%s URL=%s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p3, v4, v5

    const/4 v5, 0x2

    aput-object p4, v4, v5

    invoke-static {v2, v3, v4}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 260
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    iget v3, v2, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 265
    const/16 v2, -0xa

    if-ne p2, v2, :cond_2

    .line 266
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 267
    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    goto :goto_0

    .line 270
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 275
    :cond_2
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 277
    .local v0, "data":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "errorCode"

    invoke-virtual {v0, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 278
    const-string v2, "description"

    invoke-virtual {v0, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 279
    const-string v2, "url"

    invoke-virtual {v0, v2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    :goto_1
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v3, "onReceivedError"

    invoke-virtual {v2, v3, v0}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 280
    :catch_0
    move-exception v1

    .line 281
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/HttpAuthHandler;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "realm"    # Ljava/lang/String;

    .prologue
    .line 147
    invoke-virtual {p0, p3, p4}, Lorg/apache/cordova/CordovaWebViewClient;->getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;

    move-result-object v0

    .line 148
    .local v0, "token":Lorg/apache/cordova/AuthenticationToken;
    if-eqz v0, :cond_0

    .line 149
    invoke-virtual {v0}, Lorg/apache/cordova/AuthenticationToken;->getUserName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/cordova/AuthenticationToken;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    :goto_0
    return-void

    .line 153
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/SslErrorHandler;
    .param p3, "error"    # Landroid/net/http/SslError;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    .line 300
    iget-object v4, p0, Lorg/apache/cordova/CordovaWebViewClient;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 301
    .local v2, "packageName":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/CordovaWebViewClient;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 305
    .local v3, "pm":Landroid/content/pm/PackageManager;
    const/16 v4, 0x80

    :try_start_0
    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 306
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget v4, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_0

    .line 308
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    .line 318
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return-void

    .line 312
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 314
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 316
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    goto :goto_0
.end method

.method public removeAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;

    .prologue
    .line 347
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/AuthenticationToken;

    return-object v0
.end method

.method public setAuthenticationToken(Lorg/apache/cordova/AuthenticationToken;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "authenticationToken"    # Lorg/apache/cordova/AuthenticationToken;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "realm"    # Ljava/lang/String;

    .prologue
    .line 329
    if-nez p2, :cond_0

    .line 330
    const-string p2, ""

    .line 332
    :cond_0
    if-nez p3, :cond_1

    .line 333
    const-string p3, ""

    .line 335
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->authenticationTokens:Ljava/util/Hashtable;

    invoke-virtual {p2, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    return-void
.end method

.method public setWebView(Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "view"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewClient;->appView:Lorg/apache/cordova/CordovaWebView;

    .line 99
    new-instance v0, Lorg/apache/cordova/CordovaUriHelper;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewClient;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/CordovaUriHelper;-><init>(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->helper:Lorg/apache/cordova/CordovaUriHelper;

    .line 100
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient;->helper:Lorg/apache/cordova/CordovaUriHelper;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaUriHelper;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.class public Lorg/apache/cordova/CordovaUriHelper;
.super Ljava/lang/Object;
.source "CordovaUriHelper.java"


# static fields
.field private static final CORDOVA_EXEC_URL_PREFIX:Ljava/lang/String; = "http://cdv_exec/"

.field private static final TAG:Ljava/lang/String; = "CordovaUriHelper"


# instance fields
.field private appView:Lorg/apache/cordova/CordovaWebView;

.field private cordova:Lorg/apache/cordova/CordovaInterface;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .param p1, "cdv"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p2, p0, Lorg/apache/cordova/CordovaUriHelper;->appView:Lorg/apache/cordova/CordovaWebView;

    .line 40
    iput-object p1, p0, Lorg/apache/cordova/CordovaUriHelper;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 41
    return-void
.end method


# virtual methods
.method handleExecUrl(Ljava/lang/String;)V
    .locals 11
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x23

    const/4 v9, -0x1

    .line 47
    const-string v8, "http://cdv_exec/"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v2

    .line 48
    .local v2, "idx1":I
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 49
    .local v3, "idx2":I
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 50
    .local v4, "idx3":I
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 51
    .local v5, "idx4":I
    if-eq v2, v9, :cond_0

    if-eq v3, v9, :cond_0

    if-eq v4, v9, :cond_0

    if-ne v5, v9, :cond_1

    .line 52
    :cond_0
    const-string v8, "CordovaUriHelper"

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

    .line 61
    :goto_0
    return-void

    .line 55
    :cond_1
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 56
    .local v7, "service":Ljava/lang/String;
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {p1, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "action":Ljava/lang/String;
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "callbackId":Ljava/lang/String;
    add-int/lit8 v8, v5, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 59
    .local v6, "jsonArgs":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/cordova/CordovaUriHelper;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v8, v8, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v8, v7, v0, v1, v6}, Lorg/apache/cordova/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 74
    const-string v2, "http:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "https:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 81
    :cond_0
    invoke-static {p2}, Lorg/apache/cordova/Config;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 83
    const/4 v2, 0x0

    .line 110
    :goto_0
    return v2

    .line 87
    :cond_1
    iget-object v2, p0, Lorg/apache/cordova/CordovaUriHelper;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v2, v2, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v2, p2}, Lorg/apache/cordova/PluginManager;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 110
    :cond_2
    :goto_1
    const/4 v2, 0x1

    goto :goto_0

    .line 90
    :cond_3
    const-string v2, "file://"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "data:"

    invoke-virtual {p2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    or-int/2addr v2, v3

    if-eqz v2, :cond_4

    .line 94
    const-string v2, "app_webview"

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    goto :goto_0

    .line 99
    :cond_4
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 100
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 101
    const-string v2, "android.intent.category.BROWSABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 103
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setSelector(Landroid/content/Intent;)V

    .line 104
    iget-object v2, p0, Lorg/apache/cordova/CordovaUriHelper;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 105
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v2, "CordovaUriHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error loading url "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.class public Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter;


# static fields
.field private static mConnectPool:Ldc/squareup/okhttp3/ConnectionPool;


# instance fields
.field private eventListener:Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;

.field private throttleUtil:Lio/dcloud/common/util/ThrottleUtil;

.field private ws:Ldc/squareup/okhttp3/WebSocket;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->throttleUtil:Lio/dcloud/common/util/ThrottleUtil;

    return-void
.end method

.method static synthetic access$002(Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;Ldc/squareup/okhttp3/WebSocket;)Ldc/squareup/okhttp3/WebSocket;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->ws:Ldc/squareup/okhttp3/WebSocket;

    return-object p1
.end method

.method static synthetic access$100(Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;)Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->eventListener:Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;

    return-object p0
.end method

.method static synthetic access$200(Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;)Lio/dcloud/common/util/ThrottleUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->throttleUtil:Lio/dcloud/common/util/ThrottleUtil;

    return-object p0
.end method

.method static synthetic access$202(Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;Lio/dcloud/common/util/ThrottleUtil;)Lio/dcloud/common/util/ThrottleUtil;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->throttleUtil:Lio/dcloud/common/util/ThrottleUtil;

    return-object p1
.end method

.method private reportError(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->eventListener:Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;

    if-eqz v0, :cond_0

    .line 2
    invoke-interface {v0, p1}, Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;->onError(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public close(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->ws:Ldc/squareup/okhttp3/WebSocket;

    if-eqz v0, :cond_0

    .line 3
    :try_start_0
    invoke-interface {v0, p1, p2}, Ldc/squareup/okhttp3/WebSocket;->close(ILjava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 6
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public connect(Ljava/lang/String;Ljava/lang/String;Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;)V
    .locals 5

    .line 1
    iput-object p3, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->eventListener:Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;

    .line 3
    new-instance p3, Ldc/squareup/okhttp3/OkHttpClient$Builder;

    invoke-direct {p3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;-><init>()V

    const/4 v0, 0x0

    .line 7
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_0

    .line 8
    const-string v1, "TLSv1.2"

    invoke-static {v1}, Lio/dcloud/common/adapter/util/DCloudTrustManager;->getSSLSocketFactory(Ljava/lang/String;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v2, 0x3

    .line 10
    new-array v2, v2, [Ldc/squareup/okhttp3/ConnectionSpec;

    sget-object v3, Ldc/squareup/okhttp3/ConnectionSpec;->MODERN_TLS:Ldc/squareup/okhttp3/ConnectionSpec;

    aput-object v3, v2, v0

    sget-object v3, Ldc/squareup/okhttp3/ConnectionSpec;->COMPATIBLE_TLS:Ldc/squareup/okhttp3/ConnectionSpec;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    sget-object v3, Ldc/squareup/okhttp3/ConnectionSpec;->CLEARTEXT:Ldc/squareup/okhttp3/ConnectionSpec;

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {p3, v2}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->connectionSpecs(Ljava/util/List;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Lio/dcloud/common/adapter/util/DCloudTrustManager;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 19
    invoke-virtual {p3, v1}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Ldc/squareup/okhttp3/OkHttpClient$Builder;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 24
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v1

    .line 25
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    :cond_2
    :goto_1
    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x18

    invoke-virtual {p3, v2, v3, v1}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 30
    invoke-virtual {p3, v2, v3, v1}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 31
    invoke-static {v0}, Lio/dcloud/common/adapter/util/DCloudTrustManager;->getHostnameVerifier(Z)Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    move-result-object v0

    invoke-virtual {p3, v0}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 33
    new-instance v0, Ldc/squareup/okhttp3/Request$Builder;

    invoke-direct {v0}, Ldc/squareup/okhttp3/Request$Builder;-><init>()V

    .line 34
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 35
    const-string v1, "Sec-WebSocket-Protocol"

    invoke-virtual {v0, v1, p2}, Ldc/squareup/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;

    .line 37
    :cond_3
    const-string p2, "Origin"

    const-string v1, "http://localhost"

    invoke-virtual {v0, p2, v1}, Ldc/squareup/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;

    .line 39
    invoke-virtual {v0, p1}, Ldc/squareup/okhttp3/Request$Builder;->url(Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;

    .line 42
    invoke-virtual {v0}, Ldc/squareup/okhttp3/Request$Builder;->build()Ldc/squareup/okhttp3/Request;

    move-result-object p1

    .line 43
    invoke-virtual {p3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->build()Ldc/squareup/okhttp3/OkHttpClient;

    move-result-object p2

    .line 45
    new-instance p3, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter$1;

    invoke-direct {p3, p0}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter$1;-><init>(Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;)V

    invoke-virtual {p2, p1, p3}, Ldc/squareup/okhttp3/OkHttpClient;->newWebSocket(Ldc/squareup/okhttp3/Request;Ldc/squareup/okhttp3/WebSocketListener;)Ldc/squareup/okhttp3/WebSocket;

    return-void
.end method

.method public connect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;)V
    .locals 7

    const-string v0, "Origin"

    .line 46
    iput-object p4, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->eventListener:Lcom/taobao/weex/appfram/websocket/IWebSocketAdapter$EventListener;

    .line 48
    new-instance p4, Ldc/squareup/okhttp3/OkHttpClient$Builder;

    invoke-direct {p4}, Ldc/squareup/okhttp3/OkHttpClient$Builder;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 52
    :try_start_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-ge v3, v4, :cond_0

    .line 53
    const-string v3, "TLSv1.2"

    invoke-static {v3}, Lio/dcloud/common/adapter/util/DCloudTrustManager;->getSSLSocketFactory(Ljava/lang/String;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v4, 0x3

    .line 55
    new-array v4, v4, [Ldc/squareup/okhttp3/ConnectionSpec;

    sget-object v5, Ldc/squareup/okhttp3/ConnectionSpec;->MODERN_TLS:Ldc/squareup/okhttp3/ConnectionSpec;

    aput-object v5, v4, v2

    sget-object v5, Ldc/squareup/okhttp3/ConnectionSpec;->COMPATIBLE_TLS:Ldc/squareup/okhttp3/ConnectionSpec;

    aput-object v5, v4, v1

    sget-object v5, Ldc/squareup/okhttp3/ConnectionSpec;->CLEARTEXT:Ldc/squareup/okhttp3/ConnectionSpec;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {p4, v4}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->connectionSpecs(Ljava/util/List;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    goto :goto_0

    .line 61
    :cond_0
    invoke-static {}, Lio/dcloud/common/adapter/util/DCloudTrustManager;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    :cond_1
    :goto_0
    if-eqz v3, :cond_2

    .line 64
    invoke-virtual {p4, v3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Ldc/squareup/okhttp3/OkHttpClient$Builder;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 69
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v3

    .line 70
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 74
    :cond_2
    :goto_1
    sget-object v3, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x18

    invoke-virtual {p4, v4, v5, v3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 75
    invoke-virtual {p4, v4, v5, v3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 76
    sget-object v3, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->mConnectPool:Ldc/squareup/okhttp3/ConnectionPool;

    if-nez v3, :cond_3

    .line 77
    new-instance v3, Ldc/squareup/okhttp3/ConnectionPool;

    invoke-direct {v3}, Ldc/squareup/okhttp3/ConnectionPool;-><init>()V

    sput-object v3, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->mConnectPool:Ldc/squareup/okhttp3/ConnectionPool;

    .line 79
    :cond_3
    sget-object v3, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->mConnectPool:Ldc/squareup/okhttp3/ConnectionPool;

    invoke-virtual {p4, v3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->connectionPool(Ldc/squareup/okhttp3/ConnectionPool;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 80
    invoke-static {v2}, Lio/dcloud/common/adapter/util/DCloudTrustManager;->getHostnameVerifier(Z)Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    move-result-object v3

    invoke-virtual {p4, v3}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Ldc/squareup/okhttp3/OkHttpClient$Builder;

    .line 82
    new-instance v3, Ldc/squareup/okhttp3/Request$Builder;

    invoke-direct {v3}, Ldc/squareup/okhttp3/Request$Builder;-><init>()V

    .line 83
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 84
    const-string v4, "Sec-WebSocket-Protocol"

    invoke-virtual {v3, v4, p2}, Ldc/squareup/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;

    .line 89
    :cond_4
    :try_start_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 90
    invoke-static {p3}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    if-eqz p2, :cond_7

    .line 92
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_5
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    .line 93
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 94
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 95
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/4 v2, 0x1

    .line 98
    :cond_6
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 99
    invoke-virtual {v3, v4, p3}, Ldc/squareup/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    :catch_2
    move-exception p2

    .line 106
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_7
    if-nez v2, :cond_8

    .line 110
    const-string p2, "http://localhost"

    invoke-virtual {v3, v0, p2}, Ldc/squareup/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;

    .line 113
    :cond_8
    invoke-virtual {v3, p1}, Ldc/squareup/okhttp3/Request$Builder;->url(Ljava/lang/String;)Ldc/squareup/okhttp3/Request$Builder;

    .line 116
    invoke-virtual {v3}, Ldc/squareup/okhttp3/Request$Builder;->build()Ldc/squareup/okhttp3/Request;

    move-result-object p1

    .line 117
    invoke-virtual {p4}, Ldc/squareup/okhttp3/OkHttpClient$Builder;->build()Ldc/squareup/okhttp3/OkHttpClient;

    move-result-object p2

    .line 120
    new-instance p3, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter$2;

    invoke-direct {p3, p0}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter$2;-><init>(Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;)V

    invoke-virtual {p2, p1, p3}, Ldc/squareup/okhttp3/OkHttpClient;->newWebSocket(Ldc/squareup/okhttp3/Request;Ldc/squareup/okhttp3/WebSocketListener;)Ldc/squareup/okhttp3/WebSocket;

    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->ws:Ldc/squareup/okhttp3/WebSocket;

    if-eqz v0, :cond_0

    .line 3
    :try_start_0
    sget-object v1, Lcom/taobao/weex/appfram/websocket/WebSocketCloseCodes;->CLOSE_GOING_AWAY:Lcom/taobao/weex/appfram/websocket/WebSocketCloseCodes;

    invoke-virtual {v1}, Lcom/taobao/weex/appfram/websocket/WebSocketCloseCodes;->getCode()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ldc/squareup/okhttp3/WebSocket;->close(ILjava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public send(Lcom/alibaba/fastjson/JSONObject;)V
    .locals 4

    const-string v0, "base64"

    .line 18
    iget-object v1, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->ws:Ldc/squareup/okhttp3/WebSocket;

    if-eqz v1, :cond_2

    .line 20
    :try_start_0
    const-string v1, "@type"

    invoke-virtual {p1, v1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "some error occur"

    if-eqz v1, :cond_1

    .line 21
    :try_start_1
    const-string v3, "binary"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/JSONObject;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 22
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    if-eqz p1, :cond_0

    .line 24
    invoke-static {p1}, Ldc/squareup/okio/ByteString;->of([B)Ldc/squareup/okio/ByteString;

    move-result-object p1

    .line 25
    iget-object v0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->ws:Ldc/squareup/okhttp3/WebSocket;

    invoke-interface {v0, p1}, Ldc/squareup/okhttp3/WebSocket;->send(Ldc/squareup/okio/ByteString;)Z

    goto :goto_0

    .line 27
    :cond_0
    invoke-direct {p0, v2}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 30
    :cond_1
    invoke-direct {p0, v2}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 33
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 36
    :cond_2
    const-string p1, "WebSocket is not ready"

    invoke-direct {p0, p1}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public send(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    move-result-object v0

    .line 2
    const-string v1, "@type"

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 4
    const-string v2, "binary"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "base64"

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONObject;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5
    invoke-virtual {p0, v0}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->send(Lcom/alibaba/fastjson/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    nop

    .line 9
    :cond_0
    iget-object v0, p0, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->ws:Ldc/squareup/okhttp3/WebSocket;

    if-eqz v0, :cond_1

    .line 11
    :try_start_1
    invoke-interface {v0, p1}, Ldc/squareup/okhttp3/WebSocket;->send(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 17
    :cond_1
    const-string p1, "WebSocket is not ready"

    invoke-direct {p0, p1}, Lio/dcloud/feature/weex/adapter/DefaultWebSocketAdapter;->reportError(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

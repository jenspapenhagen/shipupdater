.class public Lorg/apache/cordova/file/Filesystem$LimitedInputStream;
.super Ljava/io/FilterInputStream;
.source "Filesystem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/file/Filesystem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "LimitedInputStream"
.end annotation


# instance fields
.field numBytesToRead:J

.field final synthetic this$0:Lorg/apache/cordova/file/Filesystem;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/file/Filesystem;Ljava/io/InputStream;J)V
    .locals 0
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "numBytesToRead"    # J

    .prologue
    .line 173
    iput-object p1, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->this$0:Lorg/apache/cordova/file/Filesystem;

    .line 174
    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 175
    iput-wide p3, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    .line 176
    return-void
.end method


# virtual methods
.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    iget-wide v0, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 180
    const/4 v0, -0x1

    .line 183
    :goto_0
    return v0

    .line 182
    :cond_0
    iget-wide v0, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    .line 183
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "buffer"    # [B
    .param p2, "byteOffset"    # I
    .param p3, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    iget-wide v2, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 188
    const/4 v1, -0x1

    .line 196
    :goto_0
    return v1

    .line 190
    :cond_0
    move v0, p3

    .line 191
    .local v0, "bytesToRead":I
    int-to-long v2, p3

    iget-wide v4, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 192
    iget-wide v2, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    long-to-int v0, v2

    .line 194
    :cond_1
    iget-object v2, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 195
    .local v1, "numBytesRead":I
    iget-wide v2, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;->numBytesToRead:J

    goto :goto_0
.end method
